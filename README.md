cefcython
===========

Cefcython is cython bindings for cef.

Building
----------
### Compiling cef
1. Download cef
2. Run the following script at the root level of the directory.

    ```export CEF_INSTALL_SYSROOT=arm64
    export GN_DEFINES="
            cc_wrapper=ccache
        enable_nacl=false
        enable_paint_preview=false
        enable_remoting=false
        enable_service_discovery=false
        is_official_build=true
        proprietary_codecs=true ffmpeg_branding=Chrome
        symbol_level=1
        use_allocator=none
        use_gnome_keyring=false
        use_kerberos=false
        use_sysroot=true
        use_system_freetype=true
        use_system_zlib=true
        use_udev=false
        use_viz_devtools=false
        "
    export CEF_ARCHIVE_FORMAT="tar.gz"
    export CCACHE_DIR=$(readlink -f build/ccache-arm64)
    nice -n 19 python tools/automate/automate-git.py --download-dir=build --force-build --minimal-distrib --build-target=cefsimple --arm64-build $@`

### Building cefcython
To build the cef whl, use the following command:

```CEF_DIST=/path/to/cef/build/chromium/src/cef/binary_distrib/{cef_tar} CEF_DEBUG=1 python setup.py bdist_wheel```

cef_tar should look something like:

```cef_binary_88.0.0+g2a64387+chromium-88.0.4324.0_linuxarm64.tar.gz```

