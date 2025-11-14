#!/bin/bash

# MarkView Setup Verification Script
# This script verifies that all necessary files are in place

echo "MarkView Setup Verification"
echo "=============================="
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check counter
checks_passed=0
total_checks=0

# Function to check file existence
check_file() {
    local file=$1
    local description=$2
    total_checks=$((total_checks + 1))

    if [ -f "$file" ]; then
        echo -e "${GREEN}[OK]${NC} $description"
        checks_passed=$((checks_passed + 1))
        return 0
    else
        echo -e "${RED}[FAIL]${NC} $description (not found: $file)"
        return 1
    fi
}

# Function to check directory existence
check_dir() {
    local dir=$1
    local description=$2
    total_checks=$((total_checks + 1))

    if [ -d "$dir" ]; then
        echo -e "${GREEN}[OK]${NC} $description"
        checks_passed=$((checks_passed + 1))
        return 0
    else
        echo -e "${RED}[FAIL]${NC} $description (not found: $dir)"
        return 1
    fi
}

echo "Checking project structure..."
echo ""

# Check directories
check_dir "MarkView" "Source directory exists"
check_dir "MarkView.xcodeproj" "Xcode project directory exists"
check_dir "MarkView/Assets.xcassets" "Assets catalog exists"

echo ""
echo "Checking source files..."
echo ""

# Check source files
check_file "MarkView/MarkViewApp.swift" "Main app file"
check_file "MarkView/MarkdownDocument.swift" "Document type file"
check_file "MarkView/ContentView.swift" "Content view file"
check_file "MarkView/Info.plist" "Info.plist file"

echo ""
echo "Checking project files..."
echo ""

# Check project files
check_file "MarkView.xcodeproj/project.pbxproj" "Xcode project file"
check_file "README.md" "README documentation"
check_file "SETUP.md" "Setup instructions"
check_file "sample.md" "Sample Markdown file"
check_file ".gitignore" "Git ignore file"

echo ""
echo "Checking asset catalog..."
echo ""

# Check assets
check_file "MarkView/Assets.xcassets/Contents.json" "Assets catalog contents"
check_file "MarkView/Assets.xcassets/AppIcon.appiconset/Contents.json" "App icon configuration"
check_file "MarkView/Assets.xcassets/AccentColor.colorset/Contents.json" "Accent color configuration"

echo ""
echo "=============================="
echo -e "Result: ${checks_passed}/${total_checks} checks passed"
echo ""

if [ $checks_passed -eq $total_checks ]; then
    echo -e "${GREEN}[OK] All checks passed! Your project is ready.${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Open MarkView.xcodeproj in Xcode"
    echo "2. Wait for Swift Package Manager to resolve dependencies"
    echo "3. Select 'My Mac' as the build target"
    echo "4. Press Cmd+R to build and run"
    echo ""
    echo "For detailed setup instructions, see SETUP.md"
else
    echo -e "${YELLOW}[WARNING] Some checks failed. Please review the missing files.${NC}"
    echo ""
    echo "See SETUP.md for detailed setup instructions."
fi

echo ""
