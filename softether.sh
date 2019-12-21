#!/bin/bash
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.31-9727-beta/softether-vpnserver-v4.31-9727-beta-2019.11.18-linux-x64-64bit.tar.gz
tar zxvf softether-vpnserver-v4.31-9727-beta-2019.11.18-linux-x64-64bit.tar.gz
cd vpnserver
make << EOF
1
1
1
EOF
cat > vpn_server.config <<EOF
# Software Configuration File
# ---------------------------
# 
#账号：vpn1
#密码：test@123456
# You may edit this file when the VPN Server / Client / Bridge program is not running.
# 
# In prior to edit this file manually by your text editor,
# shutdown the VPN Server / Client / Bridge background service.
# Otherwise, all changes will be lost.
# 
declare root
{
	uint ConfigRevision 11
	bool IPsecMessageDisplayed true
	string Region CN
	bool VgsMessageDisplayed false

	declare DDnsClient
	{
		bool Disabled false
		byte Key QSOQsrsLX1lWy9e+sHEJXH7DLB8=
		string LocalHostname instance-e5v02adj-2
		string ProxyHostName $
		uint ProxyPort 0
		uint ProxyType 0
		string ProxyUsername $
	}
	declare IPsec
	{
		bool EtherIP_IPsec true
		string IPsec_Secret vpn
		string L2TP_DefaultHub VPN
		bool L2TP_IPsec true
		bool L2TP_Raw false

		declare EtherIP_IDSettingsList
		{
		}
	}
	declare ListenerList
	{
		declare Listener0
		{
			bool DisableDos false
			bool Enabled true
			uint Port 443
		}
		declare Listener1
		{
			bool DisableDos false
			bool Enabled true
			uint Port 992
		}
		declare Listener2
		{
			bool DisableDos false
			bool Enabled true
			uint Port 1194
		}
		declare Listener3
		{
			bool DisableDos false
			bool Enabled true
			uint Port 5555
		}
	}
	declare LocalBridgeList
	{
		bool DoNotDisableOffloading false
	}
	declare ServerConfiguration
	{
		bool AcceptOnlyTls true
		uint64 AutoDeleteCheckDiskFreeSpaceMin 104857600
		uint AutoDeleteCheckIntervalSecs 300
		uint AutoSaveConfigSpan 300
		bool BackupConfigOnlyWhenModified true
		string CipherName AES128-SHA
		uint CurrentBuild 9727
		bool DisableCoreDumpOnUnix false
		bool DisableDeadLockCheck false
		bool DisableDosProction false
		bool DisableGetHostNameWhenAcceptTcp false
		bool DisableIntelAesAcceleration false
		bool DisableIPsecAggressiveMode false
		bool DisableIPv6Listener false
		bool DisableJsonRpcWebApi false
		bool DisableNatTraversal false
		bool DisableOpenVPNServer false
		bool DisableSessionReconnect false
		bool DisableSSTPServer false
		bool DontBackupConfig false
		bool EnableVpnAzure false
		bool EnableVpnOverDns false
		bool EnableVpnOverIcmp false
		byte HashedPassword GDFXLVDFIi8TePJWXNbdv5iUH1o=
		string KeepConnectHost keepalive.softether.org
		uint KeepConnectInterval 50
		uint KeepConnectPort 80
		uint KeepConnectProtocol 1
		uint64 LoggerMaxLogSize 1073741823
		uint MaxConcurrentDnsClientThreads 512
		uint MaxConnectionsPerIP 256
		uint MaxUnestablishedConnections 1000
		bool NoHighPriorityProcess false
		bool NoLinuxArpFilter false
		bool NoSendSignature false
		string OpenVPNDefaultClientOption dev-type$20tun,link-mtu$201500,tun-mtu$201500,cipher$20AES-128-CBC,auth$20SHA1,keysize$20128,key-method$202,tls-client
		string OpenVPN_UdpPortList 1194
		bool SaveDebugLog false
		byte ServerCert MIID3DCCAsSgAwIBAgIBADANBgkqhkiG9w0BAQsFADBtMR4wHAYDVQQDDBV2cG42MzgwNTgzMzEuc2VkbnMuY24xHjAcBgNVBAoMFXZwbjYzODA1ODMzMS5zZWRucy5jbjEeMBwGA1UECwwVdnBuNjM4MDU4MzMxLnNlZG5zLmNuMQswCQYDVQQGEwJVUzAeFw0xOTExMjcwODI0MjVaFw0zNzEyMzEwODI0MjVaMG0xHjAcBgNVBAMMFXZwbjYzODA1ODMzMS5zZWRucy5jbjEeMBwGA1UECgwVdnBuNjM4MDU4MzMxLnNlZG5zLmNuMR4wHAYDVQQLDBV2cG42MzgwNTgzMzEuc2VkbnMuY24xCzAJBgNVBAYTAlVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp68K3wlG3rHGFK4k4QlArxJXHet6mLj289MF6EYbUjXQMQNxT9dbsMsx5KedBCS1sr1R097KCBGAaA77Z9ortUIofGYsrrluAAyfrwqs+a1wGAmAKz8xpo+WVFTDD8d6qb5RpKtr8aiQn/qL6AX9Ce+Rwa8JgXeP/7L1IqcnEfWPEGyZ/EhpDAmjgR7RCxoHZ/UhkK84wDF7ONvm53eIyY0ejHdJMqARpBeFWYkqh3FLHqZ7/8bO93p5tkzCQIHgQ4ooM+7FBsdCDuoNGKPsd3xyUB9XK0xGPzNMVqJwRL6mGf0Lzp1T49GxvLmq3xWnqsTgsk9WlKwMNmdzgiHQtwIDAQABo4GGMIGDMA8GA1UdEwEB/wQFMAMBAf8wCwYDVR0PBAQDAgH2MGMGA1UdJQRcMFoGCCsGAQUFBwMBBggrBgEFBQcDAgYIKwYBBQUHAwMGCCsGAQUFBwMEBggrBgEFBQcDBQYIKwYBBQUHAwYGCCsGAQUFBwMHBggrBgEFBQcDCAYIKwYBBQUHAwkwDQYJKoZIhvcNAQELBQADggEBAAxCI2gJJ1XmIBYlAZXGED1O9wZhZ8sPnOA215mnEafxRoLXVpb46ldkyMJWEbASbUe6iqMX500QQ0syF03oBlF0a7/2msxloGYkv4HmOSMw0WAlqzbIicLd7ExfDHl8RDw61kFG8FIg9xvXO5/TFpuv9FGayk/yyMDJa7RY8j7vT6oUCTcSruYmIV4u/OHef7B9q+XIu2wJ24s2iryWeqmNaT3KS7K8Px7dTEGNkR7W8Ncw69PtDuOncBRq6SHyRJW6rbVNB19t79MZS/SoW9vSKcS5aETht+3jBwPrwBFwH1STNpQeEmZHCLHZAZzCfRPtIb1YjWunvs1S2JoJ2AQ=
		byte ServerKey MIIEpAIBAAKCAQEAp68K3wlG3rHGFK4k4QlArxJXHet6mLj289MF6EYbUjXQMQNxT9dbsMsx5KedBCS1sr1R097KCBGAaA77Z9ortUIofGYsrrluAAyfrwqs+a1wGAmAKz8xpo+WVFTDD8d6qb5RpKtr8aiQn/qL6AX9Ce+Rwa8JgXeP/7L1IqcnEfWPEGyZ/EhpDAmjgR7RCxoHZ/UhkK84wDF7ONvm53eIyY0ejHdJMqARpBeFWYkqh3FLHqZ7/8bO93p5tkzCQIHgQ4ooM+7FBsdCDuoNGKPsd3xyUB9XK0xGPzNMVqJwRL6mGf0Lzp1T49GxvLmq3xWnqsTgsk9WlKwMNmdzgiHQtwIDAQABAoIBAFiOXgxqRs5HTpgPXBSooUuUQQPhH67WSD1+nakMlVM2bkvkSIxk7NySgzgBuS+9/2N1Dmj5SPM34vuRpf4zv0+Lr/v6rfBcp5ZJFHAKEE4P5ZocMl8kkaEoRbklxppnvAU3KMDxcyF951tFo2uW9gqwRebm/Pst3JOqvEFfy4d0r5nGuwJG134jflCh+shMUSUftzJ7O8Uv6s/LDzHASPdvpAncTGE9c9KfZYti+uyiPfQXMAzeOj92x10+i364oHJ6KeYnerXOoCuEGXBl+V6/tpIbHBD9LqcshCtCThLR2/6taMDbTeprveQJy9L19PmXEiAmX315OJ4ZXlk0gpECgYEA3SgPcmkwKUVYe4begSEB730aRVaHf+pqp5O8ibwFxZstu3WfMX7CADVXrPltIP7Vqr28LGbIGDlUbChqdBVWoyBOxAq9evjXucpJ7vOlBCvJlutAlTItxAs6t6RzhG3aAC4EtdicNOqu+5+TWTCXoFIYw72yBmuuZaanTYeUFp8CgYEAwhpCF6hDvBx/synvKYRmJTSks2Wml5l5sjUl4V5dndDtoCD3qLbZd44wtQHK/7xy3hH8e6pf6u1jzNWyfSve5Bcp7sibOQw7ZBGO3pUwqG3VNhsfQPwmX6xt1bwsJSWCzwcJyc9sgURnoxHMYtnFUu86QtEIn8ULTcs50yI+hukCgYANTIxpP+QSh0YD359fuoFoSmibBNIPIiSZwSuUSMc8E9HTNQaGrm2yH4MPNsyWMFze8JvxO5kKw9/MxT1pj6LvGlFCPrcYPwCR/pUllmc08gEkXy86CZNw94/nXS9JJmX2ns3PtZ/nGrm9DeKJeX+Ut3sfwjeDZVRObpAe/GkuVwKBgQC/tmO1LhLIx3Uxpqd74DNraBWMw0fJ0GKsq2XgtO3OJD+vuyAh2YftV9mvzjeMY7sor6crFdprFVFPTXpfu2cI7gASwrzdmcFHUzhDjCNlGCZQrHUwIFxeftZ1FsibX/NVO+RlGaRYARJDtB6lO+ZzxalLuV7FPz+s9J8GdHpBkQKBgQCQlp2Q1jc4XxDSPSDIleYlW0Ud0XJLWiixzta7s0rq9D+iRuTjRPTsEWgjfG8YUDkacxElerPTZhFYI25pLdhRoGsYddLPyjhuA5P1wDGG3rCyO3zXcAD43IZmrxCAFA8Jns8zp432O/zdHf5WuZPmdp4GmGDYyM38QQztESkbmw==
		uint ServerLogSwitchType 4
		uint ServerType 0
		bool StrictSyslogDatetimeFormat false
		bool Tls_Disable1_0 false
		bool Tls_Disable1_1 false
		bool Tls_Disable1_2 false
		bool UseKeepConnect true
		bool UseWebTimePage false
		bool UseWebUI false

		declare GlobalParams
		{
			uint FIFO_BUDGET 10240000
			uint HUB_ARP_SEND_INTERVAL 5000
			uint IP_TABLE_EXPIRE_TIME 60000
			uint IP_TABLE_EXPIRE_TIME_DHCP 300000
			uint MAC_TABLE_EXPIRE_TIME 600000
			uint MAX_BUFFERING_PACKET_SIZE 2560000
			uint MAX_HUB_LINKS 1024
			uint MAX_IP_TABLES 65536
			uint MAX_MAC_TABLES 65536
			uint MAX_SEND_SOCKET_QUEUE_NUM 128
			uint MAX_SEND_SOCKET_QUEUE_SIZE 2560000
			uint MAX_STORED_QUEUE_NUM 1024
			uint MEM_FIFO_REALLOC_MEM_SIZE 655360
			uint MIN_SEND_SOCKET_QUEUE_SIZE 320000
			uint QUEUE_BUDGET 2048
			uint SELECT_TIME 256
			uint SELECT_TIME_FOR_NAT 30
			uint STORM_CHECK_SPAN 500
			uint STORM_DISCARD_VALUE_END 1024
			uint STORM_DISCARD_VALUE_START 3
		}
		declare ServerTraffic
		{
			declare RecvTraffic
			{
				uint64 BroadcastBytes 14187916
				uint64 BroadcastCount 232094
				uint64 UnicastBytes 280858426
				uint64 UnicastCount 439903
			}
			declare SendTraffic
			{
				uint64 BroadcastBytes 276636
				uint64 BroadcastCount 3601
				uint64 UnicastBytes 280867076
				uint64 UnicastCount 440123
			}
		}
		declare SyslogSettings
		{
			string HostName $
			uint Port 0
			uint SaveType 0
		}
	}
	declare VirtualHUB
	{
		declare VPN
		{
			uint64 CreatedTime 1574810663875
			byte HashedPassword +WzqGYrR3VYXrAhKPZLGEHcIwO8=
			uint64 LastCommTime 1575397113448
			uint64 LastLoginTime 1574873286538
			uint NumLogin 2
			bool Online true
			bool RadiusConvertAllMsChapv2AuthRequestToEap false
			string RadiusRealm $
			uint RadiusRetryInterval 0
			uint RadiusServerPort 1812
			string RadiusSuffixFilter $
			bool RadiusUsePeapInsteadOfEap false
			byte SecurePassword bpw3X/O5E8a6G6ccnl4uXmDtkwI=
			uint Type 0

			declare AccessList
			{
			}
			declare AdminOption
			{
				uint allow_hub_admin_change_option 0
				uint deny_bridge 0
				uint deny_change_user_password 0
				uint deny_empty_password 0
				uint deny_hub_admin_change_ext_option 0
				uint deny_qos 0
				uint deny_routing 0
				uint max_accesslists 0
				uint max_bitrates_download 0
				uint max_bitrates_upload 0
				uint max_groups 0
				uint max_multilogins_per_user 0
				uint max_sessions 0
				uint max_sessions_bridge 0
				uint max_sessions_client 0
				uint max_sessions_client_bridge_apply 0
				uint max_users 0
				uint no_access_list_include_file 0
				uint no_cascade 0
				uint no_change_access_control_list 0
				uint no_change_access_list 0
				uint no_change_admin_password 0
				uint no_change_cert_list 0
				uint no_change_crl_list 0
				uint no_change_groups 0
				uint no_change_log_config 0
				uint no_change_log_switch_type 0
				uint no_change_msg 0
				uint no_change_users 0
				uint no_delay_jitter_packet_loss 0
				uint no_delete_iptable 0
				uint no_delete_mactable 0
				uint no_disconnect_session 0
				uint no_enum_session 0
				uint no_offline 0
				uint no_online 0
				uint no_query_session 0
				uint no_read_log_file 0
				uint no_securenat 0
				uint no_securenat_enabledhcp 0
				uint no_securenat_enablenat 0
			}
			declare CascadeList
			{
			}
			declare LogSetting
			{
				uint PacketLogSwitchType 4
				uint PACKET_LOG_ARP 0
				uint PACKET_LOG_DHCP 1
				uint PACKET_LOG_ETHERNET 0
				uint PACKET_LOG_ICMP 0
				uint PACKET_LOG_IP 0
				uint PACKET_LOG_TCP 0
				uint PACKET_LOG_TCP_CONN 1
				uint PACKET_LOG_UDP 0
				bool SavePacketLog true
				bool SaveSecurityLog true
				uint SecurityLogSwitchType 4
			}
			declare Message
			{
			}
			declare Option
			{
				uint AccessListIncludeFileCacheLifetime 30
				uint AdjustTcpMssValue 0
				bool ApplyIPv4AccessListOnArpPacket false
				bool AssignVLanIdByRadiusAttribute false
				bool BroadcastLimiterStrictMode false
				uint BroadcastStormDetectionThreshold 0
				uint ClientMinimumRequiredBuild 0
				bool DenyAllRadiusLoginWithNoVlanAssign false
				uint DetectDormantSessionInterval 0
				bool DisableAdjustTcpMss false
				bool DisableCheckMacOnLocalBridge false
				bool DisableCorrectIpOffloadChecksum false
				bool DisableHttpParsing false
				bool DisableIPParsing false
				bool DisableIpRawModeSecureNAT false
				bool DisableKernelModeSecureNAT false
				bool DisableUdpAcceleration false
				bool DisableUdpFilterForLocalBridgeNic false
				bool DisableUserModeSecureNAT false
				bool DoNotSaveHeavySecurityLogs false
				bool DropArpInPrivacyFilterMode true
				bool DropBroadcastsInPrivacyFilterMode true
				bool FilterBPDU false
				bool FilterIPv4 false
				bool FilterIPv6 false
				bool FilterNonIP false
				bool FilterOSPF false
				bool FilterPPPoE false
				uint FloodingSendQueueBufferQuota 33554432
				bool ManageOnlyLocalUnicastIPv6 true
				bool ManageOnlyPrivateIP true
				uint MaxLoggedPacketsPerMinute 0
				uint MaxSession 0
				bool NoArpPolling false
				bool NoDhcpPacketLogOutsideHub true
				bool NoEnum false
				bool NoIpTable false
				bool NoIPv4PacketLog false
				bool NoIPv6AddrPolling false
				bool NoIPv6DefaultRouterInRAWhenIPv6 true
				bool NoIPv6PacketLog false
				bool NoLookBPDUBridgeId false
				bool NoMacAddressLog true
				bool NoManageVlanId false
				bool NoPhysicalIPOnPacketLog false
				bool NoSpinLockForPacketDelay false
				bool RemoveDefGwOnDhcpForLocalhost true
				uint RequiredClientId 0
				uint SecureNAT_MaxDnsSessionsPerIp 0
				uint SecureNAT_MaxIcmpSessionsPerIp 0
				uint SecureNAT_MaxTcpSessionsPerIp 0
				uint SecureNAT_MaxTcpSynSentPerIp 0
				uint SecureNAT_MaxUdpSessionsPerIp 0
				bool SecureNAT_RandomizeAssignIp false
				bool SuppressClientUpdateNotification false
				bool UseHubNameAsDhcpUserClassOption false
				bool UseHubNameAsRadiusNasId false
				string VlanTypeId 0x8100
				bool YieldAfterStorePacket false
			}
			declare SecureNAT
			{
				bool Disabled false
				bool SaveLog true

				declare VirtualDhcpServer
				{
					string DhcpDnsServerAddress 192.168.30.1
					string DhcpDnsServerAddress2 0.0.0.0
					string DhcpDomainName $
					bool DhcpEnabled true
					uint DhcpExpireTimeSpan 7200
					string DhcpGatewayAddress 192.168.30.1
					string DhcpLeaseIPEnd 192.168.30.200
					string DhcpLeaseIPStart 192.168.30.10
					string DhcpPushRoutes $
					string DhcpSubnetMask 255.255.255.0
				}
				declare VirtualHost
				{
					string VirtualHostIp 192.168.30.1
					string VirtualHostIpSubnetMask 255.255.255.0
					string VirtualHostMacAddress 5E-61-D8-19-A5-78
				}
				declare VirtualRouter
				{
					bool NatEnabled true
					uint NatMtu 1500
					uint NatTcpTimeout 1800
					uint NatUdpTimeout 60
				}
			}
			declare SecurityAccountDatabase
			{
				declare CertList
				{
				}
				declare CrlList
				{
				}
				declare GroupList
				{
				}
				declare IPAccessControlList
				{
				}
				declare UserList
				{
					declare vpn1
					{
						byte AuthNtLmSecureHash il0+BexC1hGnEHdOSYWeoA==
						byte AuthPassword cpd+4/+oZrTaEP8dsDC67T89PZM=
						uint AuthType 1
						uint64 CreatedTime 1574810692038
						uint64 ExpireTime 0
						uint64 LastLoginTime 1574873286538
						string Note $
						uint NumLogin 2
						string RealName $
						uint64 UpdatedTime 1574810692038

						declare Traffic
						{
							declare RecvTraffic
							{
								uint64 BroadcastBytes 179938
								uint64 BroadcastCount 2933
								uint64 UnicastBytes 264617559
								uint64 UnicastCount 242674
							}
							declare SendTraffic
							{
								uint64 BroadcastBytes 97114
								uint64 BroadcastCount 673
								uint64 UnicastBytes 11471303
								uint64 UnicastCount 83682
							}
						}
					}
				}
			}
			declare Traffic
			{
				declare RecvTraffic
				{
					uint64 BroadcastBytes 14187916
					uint64 BroadcastCount 232094
					uint64 UnicastBytes 280858426
					uint64 UnicastCount 439903
				}
				declare SendTraffic
				{
					uint64 BroadcastBytes 276636
					uint64 BroadcastCount 3601
					uint64 UnicastBytes 280867076
					uint64 UnicastCount 440123
				}
			}
		}
	}
	declare VirtualLayer3SwitchList
	{
	}
}
EOF
./vpnserver start
