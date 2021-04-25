# !/bin/bash
# 
# MIT License

#	Copyright (c) 2017 Artur Kotov

#	Permission is hereby granted, free of charge, to any person obtaining a copy
#	of this software and associated documentation files (the "Software"), to deal
#	in the Software without restriction, including without limitation the rights
#	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#	copies of the Software, and to permit persons to whom the Software is
#	furnished to do so, subject to the following conditions:

#	The above copyright notice and this permission notice shall be included in all
#	copies or substantial portions of the Software.

#	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#	SOFTWARE.
# 
# Author: Artur Kotov (zeroqwerty)
# 	Telegram: zeroqwerty
# 	Facebook: zeroqwerty
# 	VK: zeroqwerty
# 	Github: zeroqwerty
#
# Modded: iApps
# Telegram: t.me/iapps_ipa

# Directories 

DIR="`dirname \"$0\"`"


SOURCEIPA="$1"
DEVELOPER="$2"
MOBILEPROV="$3"
TARGET="$4"
BUNDLE="$5"

unzip -qo "$SOURCEIPA" -d extracted

APPLICATION=$(ls extracted/Payload/)

cp "$MOBILEPROV" "extracted/Payload/$APPLICATION/embedded.mobileprovision"
cd extracted
rm -rf "__MACOSX"
rm -rf "Payload/DS_Store"
cd ".."
echo "Resigning with certificate: $DEVELOPER"
find -d extracted  \( -name "*.app" -o -name "*.appex" -o -name "*.framework" -o -name "*.dylib" -o -name "ColoredVK2" -o -name "VKAgain" -o -name "VK\ Broadcast" \) > directories.txt
if [ "$BUNDLE" != 'null.null' ]; then
   echo "Changing BundleID with : $BUNDLE"
   /usr/libexec/PlistBuddy -c "Set:CFBundleIdentifier $BUNDLE" "extracted/Payload/$APPLICATION/Info.plist"
fi
security cms -D -i "extracted/Payload/$APPLICATION/embedded.mobileprovision" -o t_entitlements_full.plist
/usr/libexec/PlistBuddy -x -c 'Print:Entitlements' t_entitlements_full.plist > t_entitlements.plist
#/usr/libexec/PlistBuddy -c 'Print:application-identifier' t_entitlements.plist > t_entitlements_application-identifier   #save developer application-identifier to file
#/usr/libexec/PlistBuddy -c 'Print:com.apple.developer.team-identifier' t_entitlements.plist > t_entitlements_com.apple.developer.team-identifier  #save com.apple.developer.team-identifier application-identifier to file
while IFS='' read -r line || [[ -n "$line" ]]; do
    #/usr/bin/codesign -d --entitlements :-  "$line" > t_entitlements_original.plist    #save original entitlements from the app
    #/usr/libexec/PlistBuddy -x -c 'Import application-identifier t_entitlements_application-identifier' t_entitlements_original.plist #overwrite application-identifier
    #/usr/libexec/PlistBuddy -x -c 'Import com.apple.developer.team-identifier t_entitlements_com.apple.developer.team-identifier' t_entitlements_original.plist #overwrite com.apple.developer.team-identifier
    /usr/bin/codesign --continue -f -s "$DEVELOPER" --entitlements "t_entitlements.plist"  "$line"
done < directories.txt

echo "Create signed IPA"
cd extracted
rm -rf "__MACOSX"
rm -rf "Payload/DS_Store"
zip -qry ../extracted.ipa *
cd ..
mv extracted.ipa "$TARGET"

rm -rf "extracted"
rm directories.txt
rm t_entitlements.plist
rm t_entitlements_full.plist
#rm t_entitlements_original.plist
#rm t_entitlements_application-identifier
#rm t_entitlements_com.apple.developer.team-identifier



	# find -d . -type f -name "*.ipa"> files.txt
	# while IFS='' read -r line || [[ -n "$line" ]]; do
	# filename=$(basename "$line" .ipa)
	# echo "IPA: $filename"
	# #_dev1_______
	# output=$outputdirectory$filename
	# output+="_sign.ipa"

	# signIPA "$line" "$certname" "$mobileprovision" "$output" "$bundle"

	# done < files.txt
	# rm files.txt

