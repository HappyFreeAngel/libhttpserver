#!/bin/sh
make -C /Users/linyingjie/work/c-projects/demo/math -f /Users/linyingjie/work/c-projects/demo/math/CMakeScripts/math_postBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
