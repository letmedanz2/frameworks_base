LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	bootanimation_main.cpp \
	AudioPlayer.cpp \
	BootAnimation.cpp

LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES

LOCAL_C_INCLUDES += external/tinyalsa/include

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	liblog \
	libandroidfw \
	libutils \
	libbinder \
    libui \
	libskia \
    libEGL \
    libGLESv1_CM \
    libgui \
    libtinyalsa \
    libmedia

ifeq ($(TARGET_BOOTANIMATION_PRELOAD),true)
    LOCAL_CFLAGS += -DPRELOAD_BOOTANIMATION
endif

ifeq ($(TARGET_BOOTANIMATION_USE_RGB565),true)
    LOCAL_CFLAGS += -DUSE_565
endif

ifeq ($(TARGET_BOOTANIMATION_USE_RGB565),true)
    LOCAL_CFLAGS += -DUSE_565
endif

LOCAL_MODULE:= bootanimation

ifdef TARGET_32_BIT_SURFACEFLINGER
LOCAL_32_BIT_ONLY := true
endif

include $(BUILD_EXECUTABLE)
