#!/bin/sh
make -C /Users/linyingjie/work/c-projects/demo/utility -f /Users/linyingjie/work/c-projects/demo/utility/CMakeScripts/utility_postBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
