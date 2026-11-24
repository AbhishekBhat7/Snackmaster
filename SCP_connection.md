Raspbery pi
hostname : 172.16.35.102
scp -r snackmaster <PI_USERNAME>@<PI_IP>:~/
ssh rosettesmartlife@172.16.35.102 // this is to connect
ssh rosettesmartlife@172.16.35.173

scp -r snackmaster rosettesmartlife@172.16.35.102:~/
to exit: exit
password:Rsl1




On Mac
After making changes:

scp -r snackmaster rosettesmartlife@172.16.35.102:~/

On Pi
cd ~/snackmaster
flutter pub get
flutter run -d linux
flutter build linux --release




// those parts are not effiecient so we added rsync
rsync -avz --progress snackmaster/ <PI_USERNAME>@<PI_IP>:~/snackmaster/
rsync -avz --progress snackmaster/ rosettesmartlife@172.16.35.102:~/snackmaster/


rsync -avz --progress snackmaster/ rosettesmartlife@172.16.35.173:~/snackmaster/&& \ssh rosettesmartlife@172.16.35.173 "sudo systemctl restart snackmaster" 

to run this we have to do changes in pi 
ps aux | grep -i snackmaster
ls -la ~/snackmaster





rsync -avz --progress \
  --exclude='.dart_tool/' \
  --exclude='build/' \
  --exclude='.git/' \
  snackmaster/ <PI_USERNAME>@<PI_IP>:~/snackmaster/

flutter build linux --release
./build/linux/arm64/release/bundle/snackmaster
