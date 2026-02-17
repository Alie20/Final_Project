KIOSK_PLAYER_VERSION = 1.0
KIOSK_PLAYER_SITE = $(BR2_EXTERNAL_RPI5_PATH)/package/kiosk-player/files
KIOSK_PLAYER_SITE_METHOD = local
KIOSK_PLAYER_DEPENDENCIES = weston seatd

define KIOSK_PLAYER_INSTALL_TARGET_CMDS
	# -------------------------
	# Videos
	# -------------------------
	$(INSTALL) -d $(TARGET_DIR)/videos
	$(INSTALL) -m 0644 $(@D)/videos/*.mp4 $(TARGET_DIR)/videos/

	# -------------------------
	# kiosk player executable
	# -------------------------
	$(INSTALL) -D -m 0755 \
		$(@D)/kiosk-player \
		$(TARGET_DIR)/usr/bin/kiosk-player

	# -------------------------
	# weston init service
	# -------------------------
	$(INSTALL) -D -m 0755 \
		$(@D)/S80weston \
		$(TARGET_DIR)/etc/init.d/S80weston

	# runtime dir creator
	$(INSTALL) -D -m 0755 \
		$(@D)/S01runtime \
		$(TARGET_DIR)/etc/init.d/S01runtime

	# -------------------------
	# profile (environment vars)
	# -------------------------
	$(INSTALL) -D -m 0644 \
		$(@D)/profile \
		$(TARGET_DIR)/etc/profile

	# -------------------------
	# autologin configuration
	# -------------------------
	$(INSTALL) -D -m 0644 \
		$(@D)/inittab \
		$(TARGET_DIR)/etc/inittab
endef

$(eval $(generic-package))

