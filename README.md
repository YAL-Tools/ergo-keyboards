# YAL's ergo keyboard list

This is a collection of column-staggered and ortholinear ergonomic keyboards.

It is not as large as some other collections¹, but you can sort and filter the keyboards.  
¹ As far as I can tell, the collection now (Nov 2023)
covers most medium..big column-staggered keyboards
and has a fair sample of smaller ones that have interesting features/geometry.

## Adding keyboards (GUI)

You can find a visual editor on the bottom of the
[web version](https://yal-tools.github.io/ergo-keyboards/).

When you're done filling out information about the keyboard,
you can check how it looks by pressing Test
(which adds/updates it at the bottom of the list),
then press Generate JSON, and either
[create an issue](https://github.com/YAL-Tools/ergo-keyboards/issues)
or [send it to me elsewhere](https://yal.cc/about/).

Tech-savvy users can also fork the repository,
add the new keyboard to `docs/keyboards.js`,
add its photo to `docs/img` (try to keep it below 1280x960 / 350KB),
and submit a pull request.

## Building

You'll need [Haxe](https://haxe.org) installed.

Open a terminal/Command Prompt/PowerShell/whatever in the directory
(on Windows, this is done by shift-right-clicking an empty spot in Explorer),
type the following, and press Enter
```
haxe build.hxml
```
If Haxe is installed and all is well, docs/script.js will be updated.

## Credits

A tool by YellowAfterlife.  
Written in Haxe.  
Uses flag icons by famfamfam.  
Uses [Tippy](https://atomiks.github.io/tippyjs/) & [Popper](https://popper.js.org/) for "tooltips".  
Special thanks to people on the [low-profile keyboard Discord server](https://discord.gg/69UM9sQF8q)
for answering my questions about classifying keyboards.

## License

As this repository is slightly more than a dataset, it is licensed under
[Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) license.