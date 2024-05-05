#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y systemd mc vim
sudo mkdir -p /root/folder1
sudo mkdir -p /root/folder2

cat <<'EOF' | sudo tee /root/script.sh
#!/bin/bash
while true
do    
   if [ "$(ls -A /root/folder1)" ]; then
        mv -fv /root/folder1/* /root/folder2/    
   fi 
done
EOF

cat <<'EOF' | sudo tee /lib/systemd/system/yura.service

[Service]
Type=simple
ExecStart=/bin/bash /root/script.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start yura.service
sudo systemctl enable yura.service