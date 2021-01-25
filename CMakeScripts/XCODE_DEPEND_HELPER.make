# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.LIBHTTPSERVER.Debug:
/Users/linyingjie/work/c-projects/libhttpserver/Debug/libLIBHTTPSERVER.dylib:
	/bin/rm -f /Users/linyingjie/work/c-projects/libhttpserver/Debug/libLIBHTTPSERVER.dylib


PostBuild.LIBHTTPSERVER.Release:
/Users/linyingjie/work/c-projects/libhttpserver/Release/libLIBHTTPSERVER.dylib:
	/bin/rm -f /Users/linyingjie/work/c-projects/libhttpserver/Release/libLIBHTTPSERVER.dylib


PostBuild.LIBHTTPSERVER.MinSizeRel:
/Users/linyingjie/work/c-projects/libhttpserver/MinSizeRel/libLIBHTTPSERVER.dylib:
	/bin/rm -f /Users/linyingjie/work/c-projects/libhttpserver/MinSizeRel/libLIBHTTPSERVER.dylib


PostBuild.LIBHTTPSERVER.RelWithDebInfo:
/Users/linyingjie/work/c-projects/libhttpserver/RelWithDebInfo/libLIBHTTPSERVER.dylib:
	/bin/rm -f /Users/linyingjie/work/c-projects/libhttpserver/RelWithDebInfo/libLIBHTTPSERVER.dylib




# For each target create a dummy ruleso the target does not have to exist
