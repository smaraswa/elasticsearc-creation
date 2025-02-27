	echo '=====Adding Index Lifecycle Policy=====' && \
    curl -d @./ilm.json -H 'Content-Type: application/json' -X PUT "http://uspgh-neks-p10.amer.thermo.com:31500/_ilm/policy/ofm-dev-os-mon-log-ilm-policy" && \
	echo '=====Adding Index Template=====' && \
	curl -d @./index_template.json -H 'Content-Type: application/json' -X PUT "http://uspgh-neks-p10.amer.thermo.com:31500/_template/ofm-dev-os-mon-log-request-breakdown" && \
	echo '=====Adding Transform=====' && \
	curl -d @./transform.json -H 'Content-Type: application/json' -X PUT "http://uspgh-neks-p10.amer.thermo.com:31500/_transform/ofm-dev-request-breakdown" && \
	echo '=====Bootstrapping Transform=====' && \
	curl -d @./index_bootstrap.json -H 'Content-Type: application/json' -X PUT "http://uspgh-neks-p10.amer.thermo.com:31500/ofm-dev-os-mon-log-request-breakdown-000001" && \
	echo '=====Starting Transform=====' && \
	curl -X POST "http://uspgh-neks-p10.amer.thermo.com:31500/_transform/ofm-dev-request-breakdown/_start" && \
	echo '=====Setup Finished====='