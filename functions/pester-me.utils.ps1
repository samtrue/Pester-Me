
function convert-ToTestPath([string]$path){

    if(!($path.ToLower().EndsWith("tests.ps1"))){
        
        $new_path = $path -replace ".ps1", ".Tests.ps1"
        return $new_path    
    }
    else{
        return $path
    }
    
}
