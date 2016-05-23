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

local linux_patch = [[
diff --git b/config.h a/config.h
index 7cb25f9..f7dd401 100644
--- b/config.h
+++ a/config.h
@@ -2,10 +2,10 @@
 /* config.h.in.  Generated from configure.ac by autoheader.  */
 
 /* Define this if your system has a crypt() function */
-/* #undef HAVE_CRYPT */
+#define HAVE_CRYPT 1
 
 /* Define to 1 if you have the <crypt.h> header file. */
-/* #undef HAVE_CRYPT_H */
+#define HAVE_CRYPT_H 1
 
 /* Define to 1 if you have the declaration of `fdatasync', and to 0 if you
    don't. */
@@ -30,7 +30,7 @@
 #define HAVE_LIBRT 1
 
 /* Define to 1 if you have the <linux/netlink.h> header file. */
-/* #undef HAVE_LINUX_NETLINK_H */
+#define HAVE_LINUX_NETLINK_H 1
 
 /* Define to 1 if you have the <luaconf.h> header file. */
 #define HAVE_LUACONF_H 1
@@ -81,7 +81,7 @@
 #define HAVE_STRING_H 1
 
 /* Define to 1 if you have the `strlcpy' function. */
-#define HAVE_STRLCPY 1
+/* #undef HAVE_STRLCPY */
 
 /* Define if your system has SysV message APIs */
 #define HAVE_SYSV_MESSAGING 1
]]

build = {
   type = "builtin",
   platforms = {
      linux = {
         modules = {
            posix = {
               libraries = {
                  "crypt",
               }
            }
         },
         patches = {
            ["linux.patch"] = linux_patch,
         }
      }
   },
   modules = {
      posix = {
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
