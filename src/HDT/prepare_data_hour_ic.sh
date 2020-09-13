mkdir -p $(pwd)/bear-b/hour/ic/nt/
mkdir -p $(pwd)/bear-b/hour/ic/hdt/
mkdir -p $(pwd)/bear-b/hour/ic/output/
mkdir -p $(pwd)/bear-b/hour/ic/queries/
(cd $(pwd)/bear-b/hour/ic/nt/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/datasets/hour/IC/alldata.IC.nt.tar.gz && tar xf alldata.IC.nt.tar.gz && rm alldata.IC.nt.tar.gz && gzip -d *.nt.gz )
(cd $(pwd)/bear-b/hour/ic/queries/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/p/p.txt && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/po/po.txt)
for f in $(pwd)/bear-b/hour/ic/nt/*.nt
do
	input="/input/$(basename $f)"
	output=/output/$(expr $(basename $f .nt) + 0).hdt
	docker run -it --rm -v $(pwd)/bear-b/hour/ic/nt/:/input -v $(pwd)/bear-b/hour/ic/hdt/:/output rfdhdt/hdt-cpp rdf2hdt -i $input $output
done
