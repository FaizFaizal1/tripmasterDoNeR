#!/bin/bash
set -e

# Configuration
PROJECT_DIR="/home/username/Documents/tripmasterDoNeR"
TOMCAT_HOME="/home/username/tomcat"
BUILD_DIR="/tmp/TripMaster_build"
WAR_NAME="TripMaster.war"

echo "========================================"
echo "Starting Build and Deploy for TripMaster"
echo "========================================"

# 1. Clean previous build
echo "[1/6] Cleaning up..."
rm -rf "$BUILD_DIR" "$PROJECT_DIR/$WAR_NAME"
# Clean Tomcat work directory to prevent JSP caching
rm -rf "$TOMCAT_HOME/work/Catalina/localhost/TripMaster"
mkdir -p "$BUILD_DIR"

# 2. Copy Resources
echo "[2/6] Copying project files..."
# Copy all files/dirs recursively
cp -r "$PROJECT_DIR/"* "$BUILD_DIR/"
# Remove unnecessary files from build
rm -rf "$BUILD_DIR/.git"
rm -rf "$BUILD_DIR/.gitignore"
rm -f "$BUILD_DIR/build_and_deploy.sh"
rm -f "$BUILD_DIR/task.md"
rm -f "$BUILD_DIR/implementation_plan.md"

# 3. Compile Java Sources
echo "[3/6] Compiling Java sources..."
# Construct classpath: Tomcat Servlet API + Project Libs
CLASSPATH="$TOMCAT_HOME/lib/servlet-api.jar:$PROJECT_DIR/WEB-INF/lib/*"

# Ensure output directory exists (it should from cp, but safety check)
mkdir -p "$BUILD_DIR/WEB-INF/classes"

# Find source files
SOURCES_FILE="$PROJECT_DIR/sources.txt"
find "$PROJECT_DIR/WEB-INF/classes" -name "*.java" > "$SOURCES_FILE"

if [ -s "$SOURCES_FILE" ]; then
    echo "Compiling $(wc -l < "$SOURCES_FILE") source files..."
    javac -cp "$CLASSPATH" -d "$BUILD_DIR/WEB-INF/classes" @"$SOURCES_FILE"
else
    echo "Error: No Java source files found!"
    exit 1
fi
rm -f "$SOURCES_FILE"

# 4. Package WAR
echo "[4/6] Packaging WAR file..."
cd "$BUILD_DIR"
jar -cf "$PROJECT_DIR/$WAR_NAME" .
cd "$PROJECT_DIR"
echo "WAR created at: $PROJECT_DIR/$WAR_NAME"

# 5. Deploy to Tomcat
echo "[5/6] Deploying to Tomcat..."
# Shutdown Tomcat first
"$TOMCAT_HOME/bin/shutdown.sh" || echo "Tomcat was not running or shutdown failed (ignoring)"
sleep 3

# Remove old deployment
rm -rf "$TOMCAT_HOME/webapps/TripMaster"
rm -f "$TOMCAT_HOME/webapps/TripMaster.war"

# Copy new WAR
cp "$PROJECT_DIR/$WAR_NAME" "$TOMCAT_HOME/webapps/$WAR_NAME"

# 6. Start Tomcat
echo "[6/6] Starting Tomcat..."
"$TOMCAT_HOME/bin/startup.sh"

echo "========================================"
echo "Deployment Complete!"
echo "URL: http://localhost:8080/TripMaster/"
echo "========================================"
