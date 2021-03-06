# libguestfs
# Copyright (C) 2010-2017 Red Hat Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

include $(top_srcdir)/subdir-rules.mk

# In alphabetical order.
sources = \
	actions.ml \
	actions.mli \
	actions_augeas.ml \
	actions_augeas.mli \
	actions_core.ml \
	actions_core.mli \
	actions_core_deprecated.ml \
	actions_core_deprecated.mli \
	actions_debug.ml \
	actions_debug.mli \
	actions_hivex.ml \
	actions_hivex.mli \
	actions_inspection.ml \
	actions_inspection.mli \
	actions_inspection_deprecated.ml \
	actions_inspection_deprecated.mli \
	actions_internal_tests.ml \
	actions_internal_tests.mli \
	actions_properties.ml \
	actions_properties.mli \
	actions_properties_deprecated.ml \
	actions_properties_deprecated.mli \
	actions_tsk.ml \
	actions_tsk.mli \
	bindtests.ml \
	bindtests.mli \
	c.ml \
	c.mli \
	checks.ml \
	checks.mli \
	common_utils.ml \
	common_utils.mli \
	csharp.ml \
	csharp.mli \
	customize.ml \
	customize.mli \
	daemon.ml \
	daemon.mli \
	docstrings.ml \
	docstrings.mli \
	erlang.ml \
	erlang.mli \
	errnostring.ml \
	errnostring.mli \
	events.ml \
	events.mli \
	fish.ml \
	fish.mli \
	fish_commands.ml \
	fish_commands.mli \
	GObject.ml \
	GObject.mli \
	golang.ml \
	golang.mli \
	guestfs_config.ml \
	haskell.ml \
	haskell.mli \
	java.ml \
	java.mli \
	lua.ml \
	lua.mli \
	main.ml \
	OCaml.ml \
	OCaml.mli \
	optgroups.ml \
	optgroups.mli \
	perl.ml \
	perl.mli \
	php.ml \
	php.mli \
	pr.ml \
	pr.mli \
	prepopts.ml \
	prepopts.mli \
	proc_nr.ml \
	proc_nr.mli \
	python.ml \
	python.mli \
	ruby.ml \
	ruby.mli \
	structs.ml \
	structs.mli \
	tests_c_api.ml \
	tests_c_api.mli \
	types.ml \
	UEFI.ml \
	UEFI.mli \
	utils.ml \
	utils.mli \
	XDR.ml \
	XDR.mli

# In build dependency order.
objects = \
	$(OCAML_GENERATOR_BYTES_COMPAT_CMO) \
	guestfs_config.cmo \
	common_utils.cmo \
	types.cmo \
	utils.cmo \
	proc_nr.cmo \
	actions_augeas.cmo \
	actions_core.cmo \
	actions_core_deprecated.cmo \
	actions_debug.cmo \
	actions_hivex.cmo \
	actions_inspection.cmo \
	actions_inspection_deprecated.cmo \
	actions_internal_tests.cmo \
	actions_properties.cmo \
	actions_properties_deprecated.cmo \
	actions_tsk.cmo \
	actions.cmo \
	structs.cmo \
	fish_commands.cmo \
	optgroups.cmo \
	prepopts.cmo \
	events.cmo \
	pr.cmo \
	docstrings.cmo \
	checks.cmo \
	c.cmo \
	XDR.cmo \
	daemon.cmo \
	tests_c_api.cmo \
	fish.cmo \
	OCaml.cmo \
	perl.cmo \
	python.cmo \
	ruby.cmo \
	java.cmo \
	haskell.cmo \
	csharp.cmo \
	php.cmo \
	erlang.cmo \
	lua.cmo \
	GObject.cmo \
	golang.cmo \
	bindtests.cmo \
	errnostring.cmo \
	customize.cmo \
	UEFI.cmo \
	main.cmo

EXTRA_DIST = $(sources) files-generated.txt

OCAMLPACKAGES = -package unix,str -I $(srcdir) -I .
OCAMLFLAGS = $(OCAML_FLAGS) $(OCAML_WARN_ERROR)

noinst_PROGRAM = generator

if HAVE_OCAML

generator: $(objects)
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) $(OCAMLPACKAGES) -linkpkg $^ -o $@

# Dependencies.
depend: .depend

.depend: $(wildcard $(abs_srcdir)/*.mli) $(wildcard $(abs_srcdir)/*.ml) common_utils.ml common_utils.mli guestfs_config.ml
	rm -f $@ $@-t
	$(OCAMLFIND) ocamldep -I ../ocaml -I $(abs_srcdir) $^ | \
	  $(SED) 's/ *$$//' | \
	  $(SED) -e :a -e '/ *\\$$/N; s/ *\\\n */ /; ta' | \
	  $(SED) -e 's,$(abs_srcdir)/,$(builddir)/,g' | \
	  sort > $@-t
	mv $@-t $@

-include .depend

else

# No OCaml compiler.  Just replace the generator with a script that
# prints a warning.

generator:
	rm -f $@ $@-t
	echo 'echo Warning: Install OCaml compiler in order to rebuild the generated files.' > $@-t
	chmod +x $@-t
	mv $@-t $@

endif

noinst_DATA = stamp-generator

# Run the generator.
# Git removes empty directories, so in cases where the
# generator is creating the sole file in a directory, we
# have to create the directory first.
stamp-generator: generator
	mkdir -p $(top_srcdir)/perl/lib/Sys
	mkdir -p $(top_srcdir)/ruby/ext/guestfs
	mkdir -p $(top_srcdir)/java/com/redhat/et/libguestfs
	mkdir -p $(top_srcdir)/csharp
	mkdir -p $(top_srcdir)/gobject/src
	mkdir -p $(top_srcdir)/gobject/include
	mkdir -p $(top_srcdir)/gobject/include/guestfs-gobject
	cd $(top_srcdir) && $(abs_builddir)/generator
	touch $@

# We share common_utils.ml{,i} with the mllib directory.  However we
# have to remove functions which depend on any modules which are not
# part of the OCaml stdlib.
common_utils.ml: $(top_srcdir)/mllib/common_utils.ml
	rm -f $@ $@-t
	echo '(* This file is generated from mllib/common_utils.ml *)' > $@-t
	sed -n '/^(\*<stdlib>\*)$$/,/^(\*<\/stdlib>\*)$$/p' $< >> $@-t
	mv $@-t $@
common_utils.mli: $(top_srcdir)/mllib/common_utils.mli
	rm -f $@ $@-t
	echo '(* This file is generated from mllib/common_utils.mli *)' > $@-t
	sed -n '/^(\*<stdlib>\*)$$/,/^(\*<\/stdlib>\*)$$/p' $< >> $@-t
	mv $@-t $@
guestfs_config.ml: ../mllib/guestfs_config.ml
	cp $< $@

CLEANFILES += $(noinst_DATA) $(noinst_PROGRAM)

DISTCLEANFILES += .pod2text.data.version.2

SUFFIXES = .cmo .cmi .cmx .ml .mli .mll .mly
