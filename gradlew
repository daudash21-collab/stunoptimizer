#!/bin/sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a symlink
pwd -P
[ -d "$APP_HOME" ] || APP_HOME=$(dirname -- "$([[ $0 = /* ]] && echo "$0" || echo "$PWD/${0##*/}")")
APP_HOME=$( cd "${APP_HOME}" && pwd -P ) || exit

APP_NAME="Gradle"
APP_BASE_NAME=${0##*/}

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='\-Xmx64m \-Xms64m'

# Use the maximum available, or set MAX_FD != unlimited.
MAX_FD=maximum

case $( uname ) in #(
  CYGWIN* )        cygwin=true  ;; #(
  Darwin* )        darwin=true  ;; #(
  MSYS* | MINGW* ) msys=true    ;; #(
  NOTO* )          noto=true    ;; #(
  * )              linux=true   ;;
esac

if [ "$darwin" = true ] || [ "$noto" = true ] ; then
    darwin=true
fi

if [ "$cygwin" = true ] || [ "$msys" = true ] ; then
    isWindows=true
fi

if [ "$isWindows" = true ] ; then
    APP_HOME=$( cygpath --path --mixed "$APP_HOME" )
    CLASSPATH=$( cygpath --path --mixed "$CLASSPATH" )

    JAVACMD=$( cygpath --unix "$JAVA_HOME/bin/javac.exe" )
else
    JAVACMD=$( which javac )
fi

if [ ! -x "$JAVACMD" ] ; then
    echo "error: JAVA_HOME is not defined correctly." >&2
    echo "  We cannot execute java using JAVACMD=$JAVACMD" >&2
fi

if [ -z "$JAVA_HOME" ] ; then
    JAVA_HOME=$( dirname -- "$JAVACMD" )
    export JAVA_HOME
fi

if [ -n "$JAVA_HOME" ] ; then
    JAVA_HOME=$( cd "$JAVA_HOME" && pwd -P )
fi

if [ "$CLASSPATH" = "" ] ; then
    CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar
else
    CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar:$CLASSPATH
fi

if command -v uname &> /dev/null ; then
    uname -a | grep -q CYGWIN && {
        CLASSPATH=$( cygpath --path --windows "$CLASSPATH" )
    }
fi

if [ "$CLASSPATH" = "" ] ; then
    CLASSPATH=.
fi

if [ -z "$JAVA_HOME" ] ; then
    echo "error: JAVA_HOME is not defined correctly." >&2
    exit 1
fi

"$JAVA_HOME/bin/java" -version > /dev/null 2>&1 || { echo "error: JAVA_HOME=$JAVA_HOME is not a valid Java home." >&2; exit 1; }

if [ -z "$JAVA_HOME" ] ; then
    echo "warning: JAVA_HOME environment variable is not set"
fi

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar
JAVA_OPTS=" -Dfile.encoding=UTF-8 $JAVA_OPTS"

if [ "$CLASSPATH" != "" ] ; then
    CLASSPATH=$( echo "$CLASSPATH" | sed 's|:| |g' | sed 's|;| |g' | tr ' ' ':' )
fi

if [ "$CLASSPATH" = "" ] ; then
    CLASSPATH=.
fi

if [ "${JAVA_HOME}" != "" ] ; then
    JAVA_HOME="$(cd "${JAVA_HOME}" 2>/dev/null && pwd)"
fi

JAVA_OPTS="${DEFAULT_JVM_OPTS} $JAVA_OPTS"

exec "$JAVA_HOME/bin/java" $JAVA_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
