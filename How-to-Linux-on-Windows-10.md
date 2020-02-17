# How to Use Linux on Windows 10

## Enable WSL and Install Linux

You can see Microsoft's instructions with pictures here: https://docs.microsoft.com/en-us/windows/wsl/install-win10

If you'd rather read the terse instructions on this page:

1. Open a PowerShell as an admin. If you don't know how, here's one way:
    1. Press the "Windows" key. Type "powershell."
    2. A "Powershell" icon should appear as one of the search results.
    3. Right-click it to make a context menu appear.
    4. Click "Run as administrator" or something like that.
2. In the Powershell paste the following command and press Enter: `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`. (To paste in a Powershell, you might have to Right-click and look for a "paste" option in the context menu.)
3. Open the Microsoft Store and do a search in it for "Ubuntu" (or whatever your Linux distro of choice is). Click the result. Click "Get"

## Run Linux inside of Windows 10

After having installed Linux according to the instructions above, you can run Linux by pressing the "Windows" key on your keyboard, then typing "Ubuntu" (or whatever the name of your Linux distro is). An icon for your Linux distro should appear on the screen. Click it with your mouse.

This will open a command line interface. You will only be able to run command-line programs from this Linux subsystem.

## Erratat

### Copying/moving files between Linux and Windows

If you want to copy files into or from your Linux subsystem, the best option is to use the Linux command line (no drag-and-drop). (Drag-and-drop is actually an option for moving files _out_ of the Linux subsystem and into the Windows environment, but in the other direction, the implementation is highly flawed.)

To reference your Windows drives from your Linux subsystem, use the path `/mnt/`. Your drives are all mounted there. For instance, your `C:\` drive is to be found at `/mnt/c`.

Here are some examples that you can enter on your Linux command line:
```bash
# Copy a file from Linux to Windows' Desktop
cp myfile.txt /mnt/c/Users/Myself/Desktop/myfile.txt

# Copy a file from Windows to Linux
cp /mnt/c/Users/Myself/Documents/foo.docx foo.docx
```

### MySQL
This doesn't start up automatically when running Linux as a subsystem in Windows, so invoke the following:
```bash
sudo /etc/init.d/mysqld start
```
