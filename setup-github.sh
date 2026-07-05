#!/bin/bash

echo "🔑 Generating a new SSH key for GitHub..."
# Generate the key
ssh-keygen -t ed25519 -C "vicethetechguy@example.com" -f ~/.ssh/id_ed25519 -N ""

echo "🛡️  Starting the SSH agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "🔄 Changing the Git remote to use SSH instead of HTTPS..."
cd /home/Vice/Downloads/AIfest/aifest-africa
git remote set-url origin git@github.com:vicethetechguy/AIFA.git

echo ""
echo "======================================================================="
echo "✅ DONE! Now, you must copy the text below and paste it into GitHub:"
echo "======================================================================="
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
echo "======================================================================="
echo "STEPS TO FINISH:"
echo "1. Log into GitHub and go to: https://github.com/settings/keys"
echo "2. Click the green 'New SSH key' button."
echo "3. Give it a title (like 'Deepin OS') and paste the text above into the 'Key' box."
echo "4. Click 'Add SSH key'."
echo "5. Finally, run this command to push your code:"
echo "   cd /home/Vice/Downloads/AIfest/aifest-africa && git push -u origin main"
echo "======================================================================="
