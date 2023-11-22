package table;

/**
 * ...
 * @author YellowAfterlife
 */
typedef FancyTableData = {
	var columns:Array<FancyTableDataColumn>;
	var rows:Array<Array<FancyTableDataCell>>;
};
typedef FancyTableDataCell = {
	text:String,
	?bg:String,
	?fg:String,
}
typedef FancyTableDataColumn = {
	>FancyTableDataCell,
	?type:String,
};
