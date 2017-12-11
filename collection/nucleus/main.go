package main

import (
    "fmt"
    "os"
    "io/ioutil"
    "github.com/buger/jsonparser"
)

// Configuration essential paths

var CONFIG_PATH = "/Users/ial-ah/Github/dotfiles/df.configs"
var CREDCONFIG_PATH = "/Users/ial-ah/Github/dotfiles/cred.config.json"

// Setup settings vars

var SET_BIN = true
var SET_VENV = false
var SET_CACHE = false
var SET_DATA = false
var SET_HISTORY = false
var SET_DB = false

type NLS interface {
    LoadConfigurations()
}

type NLS_settings struct {
    kind string
    id string
    name string
    extra []string // {db_system, host, port, user, pw}
}

var NLS_BIN = NLS_settings{
    kind: "dir",
    id: "bin",
}
var NLS_VENV = NLS_settings{
    kind: "cdir",
    id: "venv",
    extra: []string {"cd $NUCLEUS && goenv nlsenv"},
}
var NLS_CACHE = NLS_settings{
    kind: "dir",
    id: "cache",
}
var NLS_DATA = NLS_settings{
    kind: "dir",
    id: "data",
}
var NLS_HISTORY = NLS_settings{
    kind: "file",
    id: "history",
}
var NLS_DB = NLS_settings{
    kind: "db",
    id: "database",
    extra: []string {"mysql", "localhost", "3306", "root", "uehMLMRw"},
}
var NLS_BUILD_SETTINGS = []NLS_settings{
    NLS_BIN,
    NLS_VENV,
    NLS_CACHE,
    NLS_DATA,
    NLS_HISTORY,
    NLS_DB,
}

func isError(err error) bool {
	if err != nil {
		fmt.Println(err.Error())
	}
	return (err != nil)
}

func CreateDirectory(dir string) (status bool){
    _, err := os.Stat(dir)
    if os.IsNotExist(err) {
        os.Mkdir(dir, os.ModePerm)
        return true
    } else {
        return false
    }
}

func CreateFile(path string) (status bool) {
	var _, err = os.Stat(path)
	// create file if not exists
	if os.IsNotExist(err) {
		var file, err = os.Create(path)
		if isError(err) {
            return false
        } else {
            return true
        }
		defer file.Close()
	} else {
        return false
    }
    return false
}

func ReadJsonFile(path string) (data string) {
    dat, err := ioutil.ReadFile(path)
    isError(err)
    return string(dat)
}

func ExecOsCmds() bool {
    return true
}

func ParseNucleusConfiguration(cfn string, keys ...string) (value string, status bool) {
    f := ReadJsonFile(CONFIG_PATH + "/" + cfn)
    //fmt.Println("f:", f)
    dt := []byte(f)
    value = ""
    status = false
    if len(keys) > 3 || len(keys) < 1{
        return value, status
    } else {
        if len(keys) == 1 {
            value, _, _, _ := jsonparser.Get(dt, "nucleus", keys[0])
            status = true
            return string(value), status
        } else if len(keys) == 2 {
            value, _, _, _ := jsonparser.Get(dt, "nucleus", keys[0], keys[1])
            status = true
            return string(value), status
        } else if len(keys) == 3 {
            value, _, _, _ := jsonparser.Get(dt, "nucleus", keys[0], keys[1], keys[2])
            status = true
            return string(value), status
        }
    }
    return string(value), status
}

func NucleusConfigurationDataSerie(targets []string, keys_wl ...string) []string {
    a := ""
    if len(targets) == 0 {
        a, _ = ParseNucleusConfiguration("df.config.json", keys_wl...)
        return []string{a}
    }
    nl := make([]string, len(keys_wl)+1)
    res := make([]string, len(targets)) // initialize a list with full 0
    // caused double trouble previously. take care here
    for index, elem := range targets {
        nl = keys_wl
        nl = append(nl, elem)
        f, _ := ParseNucleusConfiguration("df.config.json", nl...)
        res[index] = f
    }
    return res
}

func (nlss *NLS_settings) LoadConfigurations() {
    emptyl := []string{}
    //db_targets := []string{"system", "host", "port", "user", "password"}
    //default_db := false
    if nlss.kind == "dir" || nlss.kind == "file" {
        nlss.name = NucleusConfigurationDataSerie(emptyl, "component-tree", nlss.id)[0]
    } else if nlss.kind == "cdir" {
        //
    } else if nlss.kind == "db" {
        //db_targets := []string{"system", "host", "port", "user", "password"}
        //default_db = ParseNucleusConfiguration()
    }
}

type DotfilesEnv interface {
    Check() bool
    initialize() bool
}

type Dotfiles struct {
    // Dotfiles struct holding Dotfiles et their settings directory
    setup bool
    directory string
    settings_directory string
}

func (df *Dotfiles) Check() bool {
    // Checks Dotfiles dir exists
    return ! (os.Getenv("DOTFILES") == "")
}

func (df *Dotfiles) initialize() bool {
    // Initialize Dotfiles struct with DOTFILES real data
    if df.Check() {
        df.directory = os.Getenv("DOTFILES")
        df.settings_directory = os.Getenv("DF_SETTINGS")
        df.setup = true
        return true
    } else {
        return false
    }
}

type NucleusEnv interface {
    intialize() bool
    ShowConfiguration()
    MakeNucleusDirRoot()
    MakeSettings(directory bool, file bool, command bool, entry ...string)
    SetupNucleus()
}

type Nucleus struct {
    // Nucleus Structure
    dotfiles Dotfiles
    directory string
    set_bin bool
    set_venv bool
    set_cache bool
    set_data bool
    set_history bool
    set_db bool
}

func (nucleus *Nucleus) initialize() bool {
    //
    init_status := nucleus.dotfiles.initialize()
    if init_status {
        nucleus.directory = os.Getenv("NUCLEUS")
        nucleus.set_bin = SET_BIN
        return true
    } else {
        return false
    }
}

func (nucleus *Nucleus) ShowConfiguration() {
    fmt.Println("-------- Nucleus Configuration ---------")
    fmt.Println("Nucleus Directory :", nucleus.directory)
    fmt.Println("          SET_BIN :", nucleus.set_bin)
    fmt.Println("         SET_VENV :", nucleus.set_venv)
    fmt.Println("        SET_CACHE :", nucleus.set_cache)
    fmt.Println("         SET_DATA :", nucleus.set_data)
    fmt.Println("      SET_HISTORY :", nucleus.set_history)
    fmt.Println("     SET_DATABASE :", nucleus.set_db)
    fmt.Println("-----------------------------------------")
}

func (nucleus *Nucleus) MakeNucleusDirRoot() {
    if CreateDirectory(nucleus.directory) {
        fmt.Println("[ OK ] .. Created Nucleus Root directory")
    } else {
        fmt.Println("[WARN] ... Nucleus root directory exists already")
    }
}

func (nucleus *Nucleus) MakeSettings(directory bool, file bool,
    command bool, entry ...string) {
    if directory {
        dir_name := nucleus.directory + "/" + entry[0]
        if CreateDirectory(dir_name) {
            fmt.Println("[ OK ] ... Created", dir_name)
        } else {
            fmt.Println("[WARN] ...", dir_name, "already exists")
        }
    } else if file {
        file_name := nucleus.directory + "/" + entry[0]
        if CreateFile(file_name) {
            fmt.Println("[ OK ] ... Created", file_name)
        } else {
            fmt.Println("[WARN] ...", file_name, "already exists")
        }
    } else if command {
        fmt.Println("")
    }
}

func SetupNucleus() bool {
    n := Nucleus{}
    is := n.initialize()
    if is {
        n.ShowConfiguration()
        n.MakeNucleusDirRoot()
        n.MakeSettings(false, true, true, "loul")
    } else {
        fmt.Println("noobs")
    }
    return true
}

func main() {
    //fmt.Println(SetupNucleus())
    //d, _ := ParseNucleusConfiguration("db-credentials", "config")
    //fmt.Println(d)
    //c := []string{"bin", "venv", "data"}
    //a := NucleusConfigurationDataSerie(c, "component-tree")
    //fmt.Println(len(a))
    //for _, k := range a {
    //    fmt.Print(k+"-\n")
    //}
    fmt.Println(NLS_BIN)
    NLS_BIN.LoadConfigurations()
    fmt.Println(NLS_BIN)

}
