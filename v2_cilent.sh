
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
echo '{
  "log": {
    "error": "",
    "loglevel": "info",
    "access": ""
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "protocol": "socks",
      "settings": {
        "udp": false,
        "auth": "noauth"
      },
      "port": "1080"
    },
    {
      "listen": "127.0.0.1",
      "protocol": "http",
      "settings": {
        "timeout": 360
      },
      "port": "1087"
    }
  ],
  "outbounds": [
    {
      "mux": {
        "enabled": false,
        "concurrency": 8
      },
      "protocol": "vmess",
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/Cfxt9ijP/",
          "headers": {
            "host": ""
          }
        },
        "security": "none"
      },
      "tag": "proxy",
      "settings": {
        "vnext": [
          {
            "address": "167.179.78.38",
            "users": [
              {
                "id": "8e04047c-8301-4efa-9394-a4ad45fad6f9",
                "alterId": 0,
                "level": 0,
                "security": "aes-128-gcm"
              }
            ],
            "port": 41011
          }
        ]
      }
    },
    {
      "tag": "direct",
      "protocol": "freedom",
      "settings": {
        "domainStrategy": "UseIP",
        "userLevel": 0
      }
    },
    {
      "tag": "block",
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "none"
        }
      }
    }
  ],
  "dns": {

  },
  "routing": {
    "settings": {
      "domainStrategy": "AsIs",
      "rules": [

      ]
    }
  },
  "transport": {

  }
}' > ./config.json
sudo mkdir /etc/v2ray
sudo mv config.json /etc/v2ray/config.json

sudo systemctl start v2ray.service
sudo systemctl enable v2ray.service
