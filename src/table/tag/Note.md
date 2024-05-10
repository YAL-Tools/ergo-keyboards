# Tag-like columns

So there's a bit of a kerfuffle going on here

| Type \ Count | Single | Multiple | Shared |
| --: | --- | --- | --- |
| String | StringTagColumn | StringTagListColumn | StringTagColumnBase |
| Enum\<T\> | TagColumn | TagListColumn | TagColumnBase |
| Shared | | TagLikeListColumnTools | |

Honestly should have gone with not having single-item columns,
barely anything can truly only ever have one option - _even the keyboard's stagger_.