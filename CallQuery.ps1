[string] $ConnectionString= "Data Source=172.25.36.84\sql2017;Initial Catalog=stageadmin;user id=sa;password=amla@123"
[string] $UserSqlQuery= $("select top 10 * from CustomizedProduct order by id desc")

# declaration not necessary, but good practice
$resultsDataTable = New-Object System.Data.DataSet
$resultsDataTable = ExecuteSqlQuery $ConnectionString $UserSqlQuery 

# executes a query and populates the $datatable with the data
function ExecuteSqlQuery ($ConnectionString, $SQLQuery) {
    $DTSet = New-Object System.Data.DataSet;
    $Conn=New-Object System.Data.SQLClient.SQLConnection $ConnectionString;
    $Conn.Open();
    try
    {
        $DataCmd = New-Object System.Data.SqlClient.SqlCommand;
        $MyQuery = $SQLQuery;
        $DataCmd.CommandText = $MyQuery;
        $DataCmd.Connection = $Conn;
        $DAadapter = New-Object System.Data.SqlClient.SqlDataAdapter;
        $DAadapter.SelectCommand  = $DataCmd;
        $DAadapter.Fill($DTSet) | Out-Null;
         Write-Host "First Run"
        for ($i = 0; $i -lt $DTSet.Tables.Count; $i++) {
          $DTSet.Tables[$i] | format-table  | out-host
        }
    }
    finally
    {
        $Conn.Close();
        $Conn.Dispose();
    }

    return $DTSet;
}

#validate we got data
Write-Host ("The table contains: " + $resultsDataTable | format-table  | out-host )