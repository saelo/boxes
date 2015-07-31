Windows Boxes
=============

The following is a list of steps required to use Windows boxes in combination with vagrant.

1. Optional: During installation, choose custom install and disable any features you deem unnecessary
2. Make sure to set up the network as private network (otherwise winrm will not work)
    - To change the network type at a later point go to "HomeGroup" in the control panel and "Change network location"
3. After the installation finished, install the appropriate guest additions for your hypervisor
4. Optional: Install any software packages you want to have in your base image
5. Set up remote access for vagrant:
    - "Control Panel" -> "System" -> "Allow remote access to your computer"
    - Powershell (with Administrator privileges):

        ```powershell
        winrm quickconfig -q
        Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value True
        Set-Item WSMan:\localhost\Service\Auth\Basic -Value True
        ```

The Windows installation should now be ready for use with vagrant. To package it into a .box use

```bash
vagrant package $NAME_OF_VIRTUALBOX_VM $TARGET_NAME
```

e.g.

```bash
vagrant package windows-10-amd64 windows-10-amd64.box
```

To add the box to vagrant do

```bash
vagrant box add windows-10-amd64 /path/to/windows-10-amd64.box
```

Now set the name of the Windows box in the Vagrantfile and change the login credentials, then

```bash
vagrant up
vagrant rdp
```

enjoy :)
