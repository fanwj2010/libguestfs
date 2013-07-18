(* libguestfs
 * Copyright (C) 2009-2017 Red Hat Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *)

(* Please read generator/README first. *)

(* Each daemon function must have a unique procedure number.  Add
 * new functions at the end.
 *)
let proc_nr = [
1, "mount";
2, "sync";
3, "touch";
5, "ll";
7, "list_devices";
8, "list_partitions";
9, "pvs";
10, "vgs";
11, "lvs";
12, "pvs_full";
13, "vgs_full";
14, "lvs_full";
16, "aug_init";
17, "aug_defvar";
18, "aug_defnode";
19, "aug_get";
20, "aug_set";
21, "aug_insert";
22, "aug_rm";
23, "aug_mv";
24, "aug_match";
25, "aug_save";
26, "aug_close";
27, "aug_load";
28, "aug_ls";
29, "rm";
30, "rmdir";
31, "rm_rf";
32, "mkdir";
33, "mkdir_p";
34, "chmod";
35, "chown";
36, "exists";
37, "is_file";
38, "is_dir";
39, "pvcreate";
40, "vgcreate";
41, "lvcreate";
43, "sfdisk";
44, "write_file";
45, "umount";
46, "mounts";
47, "umount_all";
48, "lvm_remove_all";
49, "file";
50, "command";
51, "command_lines";
54, "statvfs";
55, "tune2fs_l";
56, "blockdev_setro";
57, "blockdev_setrw";
58, "blockdev_getro";
59, "blockdev_getss";
60, "blockdev_getbsz";
61, "blockdev_setbsz";
62, "blockdev_getsz";
63, "blockdev_getsize64";
64, "blockdev_flushbufs";
65, "blockdev_rereadpt";
66, "upload";
67, "download";
68, "checksum";
69, "tar_in";
70, "tar_out";
71, "tgz_in";
72, "tgz_out";
73, "mount_ro";
74, "mount_options";
75, "mount_vfs";
76, "debug";
77, "lvremove";
78, "vgremove";
79, "pvremove";
80, "set_e2label";
81, "get_e2label";
82, "set_e2uuid";
83, "get_e2uuid";
84, "fsck";
85, "zero";
86, "grub_install";
87, "cp";
88, "cp_a";
89, "mv";
90, "drop_caches";
91, "dmesg";
92, "ping_daemon";
93, "equal";
94, "strings";
95, "strings_e";
96, "hexdump";
97, "zerofree";
98, "pvresize";
99, "sfdisk_N";
100, "sfdisk_l";
101, "sfdisk_kernel_geometry";
102, "sfdisk_disk_geometry";
103, "vg_activate_all";
104, "vg_activate";
105, "lvresize";
106, "resize2fs";
108, "e2fsck_f";
109, "sleep";
110, "ntfs_3g_probe";
111, "sh";
112, "sh_lines";
113, "glob_expand";
114, "scrub_device";
115, "scrub_file";
116, "scrub_freespace";
117, "mkdtemp";
118, "wc_l";
119, "wc_w";
120, "wc_c";
121, "head";
122, "head_n";
123, "tail";
124, "tail_n";
125, "df";
126, "df_h";
127, "du";
128, "initrd_list";
129, "mount_loop";
130, "mkswap";
131, "mkswap_L";
132, "mkswap_U";
133, "mknod";
134, "mkfifo";
135, "mknod_b";
136, "mknod_c";
137, "umask";
138, "readdir";
139, "sfdiskM";
140, "zfile";
141, "getxattrs";
142, "lgetxattrs";
143, "setxattr";
144, "lsetxattr";
145, "removexattr";
146, "lremovexattr";
147, "mountpoints";
148, "mkmountpoint";
149, "rmmountpoint";
151, "grep";
152, "egrep";
153, "fgrep";
154, "grepi";
155, "egrepi";
156, "fgrepi";
157, "zgrep";
158, "zegrep";
159, "zfgrep";
160, "zgrepi";
161, "zegrepi";
162, "zfgrepi";
163, "realpath";
164, "ln";
165, "ln_f";
166, "ln_s";
167, "ln_sf";
168, "readlink";
169, "fallocate";
170, "swapon_device";
171, "swapoff_device";
172, "swapon_file";
173, "swapoff_file";
174, "swapon_label";
175, "swapoff_label";
176, "swapon_uuid";
177, "swapoff_uuid";
178, "mkswap_file";
179, "inotify_init";
180, "inotify_add_watch";
181, "inotify_rm_watch";
182, "inotify_read";
183, "inotify_files";
184, "inotify_close";
185, "setcon";
186, "getcon";
187, "mkfs_b";
188, "mke2journal";
189, "mke2journal_L";
190, "mke2journal_U";
191, "mke2fs_J";
192, "mke2fs_JL";
193, "mke2fs_JU";
194, "modprobe";
195, "echo_daemon";
196, "find0";
197, "case_sensitive_path";
198, "vfs_type";
199, "truncate";
200, "truncate_size";
201, "utimens";
202, "mkdir_mode";
203, "lchown";
205, "internal_lxattrlist";
206, "internal_readlinklist";
207, "pread";
208, "part_init";
209, "part_add";
210, "part_disk";
211, "part_set_bootable";
212, "part_set_name";
213, "part_list";
214, "part_get_parttype";
215, "fill";
217, "dd";
218, "filesize";
219, "lvrename";
220, "vgrename";
221, "initrd_cat";
222, "pvuuid";
223, "vguuid";
224, "lvuuid";
225, "vgpvuuids";
226, "vglvuuids";
227, "copy_size";
228, "zero_device";
229, "txz_in";
230, "txz_out";
232, "vgscan";
233, "part_del";
234, "part_get_bootable";
235, "part_get_mbr_id";
236, "part_set_mbr_id";
237, "checksum_device";
238, "lvresize_free";
239, "aug_clear";
240, "get_umask";
241, "debug_upload";
242, "base64_in";
243, "base64_out";
244, "checksums_out";
245, "fill_pattern";
246, "internal_write";
247, "pwrite";
248, "resize2fs_size";
249, "pvresize_size";
250, "ntfsresize_size";
251, "available_all_groups";
252, "fallocate64";
253, "vfs_label";
254, "vfs_uuid";
255, "lvm_set_filter";
256, "lvm_clear_filter";
257, "luks_open";
258, "luks_open_ro";
259, "luks_close";
260, "luks_format";
261, "luks_format_cipher";
262, "luks_add_key";
263, "luks_kill_slot";
264, "is_lv";
265, "findfs_uuid";
266, "findfs_label";
267, "is_chardev";
268, "is_blockdev";
269, "is_fifo";
270, "is_symlink";
271, "is_socket";
272, "part_to_dev";
273, "upload_offset";
274, "download_offset";
275, "pwrite_device";
276, "pread_device";
277, "lvm_canonical_lv_name";
278, "mkfs";
279, "getxattr";
280, "lgetxattr";
281, "resize2fs_M";
282, "internal_autosync";
283, "is_zero";
284, "is_zero_device";
287, "list_dm_devices";
288, "ntfsresize";
289, "btrfs_filesystem_resize";
290, "internal_write_append";
291, "compress_out";
292, "compress_device_out";
293, "part_to_partnum";
294, "copy_device_to_device";
295, "copy_device_to_file";
296, "copy_file_to_device";
297, "copy_file_to_file";
298, "tune2fs";
299, "md_create";
300, "list_md_devices";
301, "md_detail";
302, "md_stop";
303, "blkid";
304, "e2fsck";
305, "llz";
306, "wipefs";
307, "ntfsfix";
308, "ntfsclone_out";
309, "ntfsclone_in";
310, "set_label";
311, "zero_free_space";
312, "lvcreate_free";
313, "isoinfo_device";
314, "isoinfo";
315, "vgmeta";
316, "md_stat";
317, "mkfs_btrfs";
318, "get_e2attrs";
319, "set_e2attrs";
320, "get_e2generation";
321, "set_e2generation";
322, "btrfs_subvolume_snapshot";
323, "btrfs_subvolume_delete";
324, "btrfs_subvolume_create";
325, "btrfs_subvolume_list";
326, "btrfs_subvolume_set_default";
327, "btrfs_filesystem_sync";
328, "btrfs_filesystem_balance";
329, "btrfs_device_add";
330, "btrfs_device_delete";
331, "btrfs_set_seeding";
332, "btrfs_fsck";
333, "filesystem_available";
334, "fstrim";
335, "device_index";
336, "nr_devices";
337, "xfs_info";
338, "pvchange_uuid";
339, "pvchange_uuid_all";
340, "vgchange_uuid";
341, "vgchange_uuid_all";
342, "utsname";
343, "xfs_growfs";
344, "rsync";
345, "rsync_in";
346, "rsync_out";
347, "ls0";
348, "fill_dir";
349, "xfs_admin";
350, "hivex_open";
351, "hivex_close";
352, "hivex_root";
353, "hivex_node_name";
354, "hivex_node_children";
355, "hivex_node_get_child";
356, "hivex_node_parent";
357, "hivex_node_values";
358, "hivex_node_get_value";
359, "hivex_value_key";
360, "hivex_value_type";
361, "hivex_value_value";
362, "hivex_commit";
363, "hivex_node_add_child";
364, "hivex_node_delete_child";
365, "hivex_node_set_value";
366, "xfs_repair";
367, "rm_f";
368, "mke2fs";
369, "list_disk_labels";
370, "internal_hot_add_drive";
371, "internal_hot_remove_drive_precheck";
372, "internal_hot_remove_drive";
373, "mktemp";
374, "mklost_and_found";
375, "acl_get_file";
376, "acl_set_file";
377, "acl_delete_def_file";
378, "cap_get_file";
379, "cap_set_file";
380, "list_ldm_volumes";
381, "list_ldm_partitions";
382, "ldmtool_create_all";
383, "ldmtool_remove_all";
384, "ldmtool_scan";
385, "ldmtool_scan_devices";
386, "ldmtool_diskgroup_name";
387, "ldmtool_diskgroup_volumes";
388, "ldmtool_diskgroup_disks";
389, "ldmtool_volume_type";
390, "ldmtool_volume_hint";
391, "ldmtool_volume_partitions";
392, "part_set_gpt_type";
393, "part_get_gpt_type";
394, "rename";
395, "is_whole_device";
396, "internal_parse_mountable";
397, "internal_rhbz914931";
399, "syslinux";
400, "extlinux";
401, "cp_r";
402, "remount";
403, "set_uuid";
404, "journal_open";
405, "journal_close";
406, "journal_next";
407, "journal_skip";
408, "internal_journal_get";
409, "journal_get_data_threshold";
410, "journal_set_data_threshold";
411, "aug_setm";
412, "aug_label";
413, "internal_upload";
414, "internal_exit";
415, "copy_attributes";
416, "part_get_name";
417, "blkdiscard";
418, "blkdiscardzeroes";
419, "cpio_out";
420, "journal_get_realtime_usec";
421, "statns";
422, "lstatns";
423, "internal_lstatnslist";
424, "blockdev_setra";
425, "btrfs_subvolume_get_default";
426, "btrfs_subvolume_show";
427, "btrfs_quota_enable";
428, "btrfs_quota_rescan";
429, "btrfs_qgroup_limit";
430, "btrfs_qgroup_create";
431, "btrfs_qgroup_destroy";
432, "btrfs_qgroup_show";
433, "btrfs_qgroup_assign";
434, "btrfs_qgroup_remove";
435, "btrfs_scrub_start";
436, "btrfs_scrub_cancel";
437, "btrfs_scrub_resume";
438, "btrfs_balance_pause";
439, "btrfs_balance_cancel";
440, "btrfs_balance_resume";
443, "btrfs_filesystem_defragment";
444, "btrfs_rescue_chunk_recover";
445, "btrfs_rescue_super_recover";
446, "part_set_gpt_guid";
447, "part_get_gpt_guid";
448, "btrfs_balance_status";
449, "btrfs_scrub_status";
450, "btrfstune_seeding";
451, "btrfstune_enable_extended_inode_refs";
452, "btrfstune_enable_skinny_metadata_extent_refs";
453, "btrfs_image";
454, "part_get_mbr_part_type";
455, "btrfs_replace";
456, "set_uuid_random";
457, "vfs_minimum_size";
458, "internal_feature_available";
459, "part_set_disk_guid";
460, "part_get_disk_guid";
461, "part_set_disk_guid_random";
462, "part_expand_gpt";
463, "ntfscat_i";
464, "download_inode";
465, "btrfs_filesystem_show";
466, "internal_filesystem_walk";
467, "selinux_relabel";
468, "download_blocks";
469, "aug_transform";
470, "internal_find_inode";
471, "mksquashfs";
]

(* End of list.  If adding a new entry, add it at the end of the list
 * above.  Do not modify anything below this line.
 *----------------------------------------------------------------------
 *)

let max_proc_nr =
  (* Checks the list of procedure numbers is monotonically increasing,
   * which guarantees there are no duplicates.
   *)
  let v = ref (fst (List.hd proc_nr) - 1) in
  List.iter (
    fun (v', _) ->
      if !v >= v' then
        failwith "proc_nr.ml: list of procedure numbers is not monotonically increasing";
      v := v'
  ) proc_nr;

  (* This is used to generate the lib/MAX_PROC_NR file which
   * contains the maximum procedure number, a surrogate for the
   * ABI version number.  See lib/Makefile.am for the details.
   *)
  !v

let () =
  (* Check there are no duplicate names. *)
  let h = Hashtbl.create (List.length proc_nr) in
  List.iter (
    fun (_, name) ->
      if Hashtbl.mem h name then
        failwith "proc_nr.ml: duplicate name in procedure table";
      Hashtbl.add h name true
  ) proc_nr
