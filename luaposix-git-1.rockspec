package = "luaposix"
version = "scm-1"
description = {
  detailed = "A library binding various POSIX APIs. POSIX is the IEEE Portable Operating System Interface standard. luaposix is based on lposix.",
  homepage = "http://github.com/hishamhm/luaposix/",
  license = "MIT/X11",
  summary = "Lua bindings for POSIX",
}
source = {
  url = "git://github.com/luaposix/luaposix.git",
  branch = "cygwin",
}
dependencies = {
  "lua >= 5.1, < 5.4",
  "bit32",
}
external_dependencies = nil
build = {
   type = "builtin",
   modules = {
      posix = {
         incdirs = {
            "./ext/include",
         },
         sources = {
            "./ext/posix/dirent.c",
            "./ext/posix/fcntl.c",
            "./ext/posix/glob.c",
            "./ext/posix/poll.c",
            "./ext/posix/stdlib.c",
            "./ext/posix/syslog.c",
            "./ext/posix/errno.c",
            "./ext/posix/libgen.c",
            "./ext/posix/sched.c",
            "./ext/posix/grp.c",
            "./ext/posix/fnmatch.c",
            "./ext/posix/getopt.c",
            "./ext/posix/time.c",
            "./ext/posix/utime.c",
            "./ext/posix/termio.c",
            "./ext/posix/signal.c",
            "./ext/posix/posix.c",
            "./ext/posix/sys/wait.c",
            "./ext/posix/sys/resource.c",
            "./ext/posix/sys/stat.c",
            "./ext/posix/sys/time.c",
            "./ext/posix/sys/msg.c",
            "./ext/posix/sys/utsname.c",
            "./ext/posix/sys/socket.c",
            "./ext/posix/sys/times.c",
            "./ext/posix/sys/statvfs.c",
            "./ext/posix/ctype.c",
            "./ext/posix/unistd.c",
            "./ext/posix/pwd.c",
            "./ext/posix/stdio.c",
         },
      },
      ["posix._argcheck"] = "./lib/posix/_argcheck.lua",
      ["posix.compat"] = "./lib/posix/compat.lua",
      ["posix.util"] = "./lib/posix/util.lua",
      ["posix.deprecated"] = "./lib/posix/deprecated.lua",
      ["posix.sys"] = "./lib/posix/sys.lua",
      ["posix.init"] = "./lib/posix/init.lua",
   },
}
