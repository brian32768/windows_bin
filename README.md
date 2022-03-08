# windows_bin

Some of the files I keep in my Windows bin folder.
I am starting to make it Linux compatible too.

cmd | desc
--- | ----
**bashrc** | echo "source bin/bashrc" >> ~/.bashrc
**condarc** | Load into conda somehow, see "conda info"
**drmi** | Purge dead Docker images
**killnode** | Kill the node.exe processes leftover by parcel.
**open** | An attempt to make 'open' work like it does in MacOS.
**uptime** | Something to say when Brian compulsively types "uptime".

## Release notes

This repo was handy so I am using it to test 
building a release and attaching an asset to it.

I want the release file to container the list of bins and this README.md

I want it to be downloadable as a zip file from a fixed location.

[Here](https://stackoverflow.com/questions/5207269/how-to-release-a-build-artifact-asset-on-github-with-a-script)
are instructions on how to do a release, including an asset file.

1. Install [github-release](https://github.com/github-release/github-release/releases) (just download and copy to bin/)
2. [Create a github personal access token](https://github.com/settings/tokens) and store it in .env
3. Source .env
4. git tag -a 1.0 -m "release note" && git push --tags
5. github-release info
6. github-release release -u brian32768 -r windows_bin --tag 1.0 --name "windows_bin 1.0 release" --description "My first release ever for this project" --pre-release
7. Make a zip file. zip assets/windows_bin_1.0.zip open uptime bashrc condarc acrobat killnode drmi
8. Upload the zip. github-release upload -u brian32768 -r windows_bin --tag 1.0 --name 'zipped files' --file assets/windows_bin_1.0.zip