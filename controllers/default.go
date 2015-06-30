package controllers

import (
	"encoding/json"
	"io/ioutil"
	"net/http"

	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

type Health struct {
	Status string `json:"status"`
	Output struct {
		Detail     []interface{} `json:"detail"`
		Timechecks struct {
			RoundStatus string `json:"round_status"`
			Epoch       int    `json:"epoch"`
			Round       int    `json:"round"`
		} `json:"timechecks"`
		Health struct {
			HealthServices []struct {
				Mons []struct {
					LastUpdated  string `json:"last_updated"`
					Name         string `json:"name"`
					AvailPercent int    `json:"avail_percent"`
					KbTotal      int    `json:"kb_total"`
					KbAvail      int    `json:"kb_avail"`
					Health       string `json:"health"`
					KbUsed       int    `json:"kb_used"`
					StoreStats   struct {
						BytesTotal  int    `json:"bytes_total"`
						BytesLog    int    `json:"bytes_log"`
						LastUpdated string `json:"last_updated"`
						BytesMisc   int    `json:"bytes_misc"`
						BytesSst    int    `json:"bytes_sst"`
					} `json:"store_stats"`
				} `json:"mons"`
			} `json:"health_services"`
		} `json:"health"`
		OverallStatus string        `json:"overall_status"`
		Summary       []interface{} `json:"summary"`
	} `json:"output"`
}

type OsdDf struct {
	Status string `json:"status"`
	Output struct {
		Nodes []struct {
			Kb          int     `json:"kb"`
			Name        string  `json:"name"`
			TypeID      int     `json:"type_id"`
			Reweight    float64 `json:"reweight"`
			CrushWeight float64 `json:"crush_weight"`
			Utilization float64 `json:"utilization"`
			Depth       int     `json:"depth"`
			KbAvail     int     `json:"kb_avail"`
			KbUsed      int     `json:"kb_used"`
			Var         float64 `json:"var"`
			Type        string  `json:"type"`
			ID          int     `json:"id"`
		} `json:"nodes"`
		Stray   []interface{} `json:"stray"`
		Summary struct {
			TotalKb            int     `json:"total_kb"`
			Dev                float64 `json:"dev"`
			MaxVar             float64 `json:"max_var"`
			TotalKbAvail       int     `json:"total_kb_avail"`
			MinVar             float64 `json:"min_var"`
			AverageUtilization float64 `json:"average_utilization"`
			TotalKbUsed        int     `json:"total_kb_used"`
		} `json:"summary"`
	} `json:"output"`
}

type AuthList struct {
	Status string `json:"status"`
	Output struct {
		AuthDump []struct {
			Caps struct {
				Mds string `json:"mds"`
				Mon string `json:"mon"`
				Osd string `json:"osd"`
			} `json:"caps"`
			Key    string `json:"key"`
			Entity string `json:"entity"`
		} `json:"auth_dump"`
	} `json:"output"`
}

type MdsCompatShow struct {
	Status string `json:"status"`
	Output struct {
		Compat struct {
		} `json:"compat"`
		RoCompat struct {
		} `json:"ro_compat"`
		Incompat struct {
			Feature8 string `json:"feature_8"`
			Feature2 string `json:"feature_2"`
			Feature3 string `json:"feature_3"`
			Feature1 string `json:"feature_1"`
			Feature6 string `json:"feature_6"`
			Feature4 string `json:"feature_4"`
			Feature5 string `json:"feature_5"`
		} `json:"incompat"`
	} `json:"output"`
}

func RequestJson(url string) []byte {
	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Set("Accept", "application/json")
	client := &http.Client{}
	resp, _ := client.Do(req)
	defer resp.Body.Close()
	body, _ := ioutil.ReadAll(resp.Body)
	return body
}

type MdsStat struct {
	Status string `json:"status"`
	Output struct {
		MdsmapFirstCommitted int `json:"mdsmap_first_committed"`
		Mdsmap               struct {
			SessionAutoclose int `json:"session_autoclose"`
			Up               struct {
				Mds0 int `json:"mds_0"`
			} `json:"up"`
			LastFailureOsdEpoch int           `json:"last_failure_osd_epoch"`
			In                  []int         `json:"in"`
			LastFailure         int           `json:"last_failure"`
			MaxFileSize         int64         `json:"max_file_size"`
			Tableserver         int           `json:"tableserver"`
			MetadataPool        int           `json:"metadata_pool"`
			Failed              []interface{} `json:"failed"`
			Epoch               int           `json:"epoch"`
			Flags               int           `json:"flags"`
			MaxMds              int           `json:"max_mds"`
			Compat              struct {
				Compat struct {
				} `json:"compat"`
				RoCompat struct {
				} `json:"ro_compat"`
				Incompat struct {
					Feature8 string `json:"feature_8"`
					Feature2 string `json:"feature_2"`
					Feature3 string `json:"feature_3"`
					Feature1 string `json:"feature_1"`
					Feature6 string `json:"feature_6"`
					Feature4 string `json:"feature_4"`
					Feature5 string `json:"feature_5"`
				} `json:"incompat"`
			} `json:"compat"`
			DataPools []int `json:"data_pools"`
			Info      struct {
				Gid4106 struct {
					StandbyForRank int           `json:"standby_for_rank"`
					ExportTargets  []interface{} `json:"export_targets"`
					Name           string        `json:"name"`
					Incarnation    int           `json:"incarnation"`
					StateSeq       int           `json:"state_seq"`
					State          string        `json:"state"`
					Gid            int           `json:"gid"`
					Rank           int           `json:"rank"`
					StandbyForName string        `json:"standby_for_name"`
					Addr           string        `json:"addr"`
				} `json:"gid_4106"`
			} `json:"info"`
			FsName         string        `json:"fs_name"`
			Created        string        `json:"created"`
			Enabled        bool          `json:"enabled"`
			Modified       string        `json:"modified"`
			SessionTimeout int           `json:"session_timeout"`
			Stopped        []interface{} `json:"stopped"`
			Root           int           `json:"root"`
		} `json:"mdsmap"`
		MdsmapLastCommitted int `json:"mdsmap_last_committed"`
	} `json:"output"`
}

type OsdCrushDump struct {
	Status string `json:"status"`
	Output struct {
		Rules []struct {
			MinSize  int    `json:"min_size"`
			RuleName string `json:"rule_name"`
			Steps    []struct {
				ItemName string `json:"item_name"`
				Item     int    `json:"item"`
				Op       string `json:"op"`
			} `json:"steps"`
			Ruleset int `json:"ruleset"`
			Type    int `json:"type"`
			RuleID  int `json:"rule_id"`
			MaxSize int `json:"max_size"`
		} `json:"rules"`
		Tunables struct {
			Profile                  string `json:"profile"`
			HasV3Rules               int    `json:"has_v3_rules"`
			HasV4Buckets             int    `json:"has_v4_buckets"`
			ChooseTotalTries         int    `json:"choose_total_tries"`
			RequireFeatureTunables3  int    `json:"require_feature_tunables3"`
			LegacyTunables           int    `json:"legacy_tunables"`
			ChooseleafDescendOnce    int    `json:"chooseleaf_descend_once"`
			AllowedBucketAlgs        int    `json:"allowed_bucket_algs"`
			ChooseLocalFallbackTries int    `json:"choose_local_fallback_tries"`
			HasV2Rules               int    `json:"has_v2_rules"`
			StrawCalcVersion         int    `json:"straw_calc_version"`
			RequireFeatureTunables2  int    `json:"require_feature_tunables2"`
			OptimalTunables          int    `json:"optimal_tunables"`
			ChooseLocalTries         int    `json:"choose_local_tries"`
			ChooseleafVaryR          int    `json:"chooseleaf_vary_r"`
			RequireFeatureTunables   int    `json:"require_feature_tunables"`
		} `json:"tunables"`
		Buckets []struct {
			Hash     string `json:"hash"`
			Name     string `json:"name"`
			Weight   int    `json:"weight"`
			TypeID   int    `json:"type_id"`
			Alg      string `json:"alg"`
			TypeName string `json:"type_name"`
			Items    []struct {
				ID     int `json:"id"`
				Weight int `json:"weight"`
				Pos    int `json:"pos"`
			} `json:"items"`
			ID int `json:"id"`
		} `json:"buckets"`
		Types []struct {
			Name   string `json:"name"`
			TypeID int    `json:"type_id"`
		} `json:"types"`
		Devices []struct {
			ID   int    `json:"id"`
			Name string `json:"name"`
		} `json:"devices"`
	} `json:"output"`
}

type OsdTree struct {
	Status string `json:"status"`
	Output struct {
		Nodes []struct {
			Children []int  `json:"children"`
			TypeID   int    `json:"type_id"`
			Type     string `json:"type"`
			ID       int    `json:"id"`
			Name     string `json:"name"`
		} `json:"nodes"`
		Stray []interface{} `json:"stray"`
	} `json:"output"`
}

type PgStat struct {
	Status string `json:"status"`
	Output struct {
		NumPgByState []struct {
			Num  int    `json:"num"`
			Name string `json:"name"`
		} `json:"num_pg_by_state"`
		NumPgs        int   `json:"num_pgs"`
		RawBytes      int64 `json:"raw_bytes"`
		NumBytes      int   `json:"num_bytes"`
		Version       int   `json:"version"`
		RawBytesUsed  int64 `json:"raw_bytes_used"`
		RawBytesAvail int64 `json:"raw_bytes_avail"`
	} `json:"output"`
}

func (c *MainController) Get() {

	baseUrl := "http://127.0.0.1:5000/api/v0.1"

	// Request health
	body := RequestJson(baseUrl + "/health")
	var health Health
	err := json.Unmarshal(body, &health)
	if err != nil {
		panic(err)
	}
	c.Data["health"] = health

	// Request osd df
	body = RequestJson(baseUrl + "/osd/df")
	var osdDf OsdDf
	err = json.Unmarshal(body, &osdDf)
	if err != nil {
		panic(err)
	}
	c.Data["osdDf"] = osdDf

	// Request auth list
	/*
		body = RequestJson(baseUrl + "/auth/list");
		var authList AuthList
		err = json.Unmarshal(body, &authList)
		if err != nil {
			panic(err)
		}
		c.Data["authList"] = authList
	*/

	// Request mds compat show
	body = RequestJson(baseUrl + "/auth/list")
	var mdsCompatShow MdsCompatShow
	err = json.Unmarshal(body, &mdsCompatShow)
	if err != nil {
		panic(err)
	}
	c.Data["mdsCompatShow"] = mdsCompatShow

	// Request mds stat
	body = RequestJson(baseUrl + "/mds/stat")
	var mdsStat MdsStat
	err = json.Unmarshal(body, &mdsStat)
	if err != nil {
		panic(err)
	}
	c.Data["mdsStat"] = mdsStat

	// Request osd crush dump
	body = RequestJson(baseUrl + "/osd/crush/dump")
	var osdCrushDump OsdCrushDump
	err = json.Unmarshal(body, &osdCrushDump)
	if err != nil {
		panic(err)
	}
	c.Data["osdCrushDump"] = osdCrushDump

	// Request osd tree
	body = RequestJson(baseUrl + "/osd/tree")
	var osdTree OsdTree
	err = json.Unmarshal(body, &osdTree)
	if err != nil {
		panic(err)
	}
	c.Data["osdTree"] = osdTree

	// Request pg stat
	body = RequestJson(baseUrl + "/pg/stat")
	var pgStat PgStat
	err = json.Unmarshal(body, &pgStat)
	if err != nil {
		panic(err)
	}
	c.Data["pgStat"] = pgStat

	c.TplNames = "index.tpl"
}
