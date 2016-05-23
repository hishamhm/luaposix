package = "luaposix"
version = "git-1"
description = {
  detailed = "A library binding various POSIX APIs. POSIX is the IEEE Portable Operating System Interface standard. luaposix is based on lposix.",
  homepage = "http://github.com/luaposix/luaposix/",
  license = "MIT/X11",
  summary = "Lua bindings for POSIX",
}
source = {
  url = "git://github.com/hishamhm/luaposix.git",
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
         libraries = {
            "crypt",
         },
         incdirs = {
            ".",
            "./ext/include",
            "./ext/posix",
         },
         sources = {
            "./ext/posix/posix.c",
         },
      },
      ["posix._argcheck"] = "./lib/posix/_argcheck.lua",
      ["posix.compat"] = "./lib/posix/compat.lua",
      ["posix.util"] = "./lib/posix/util.lua",
      ["posix.deprecated"] = "./lib/posix/deprecated.lua",
      ["posix.sys"] = "./lib/posix/sys.lua",
   },
}
