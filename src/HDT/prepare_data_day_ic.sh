mkdir -p $(pwd)/bear-b/day/ic/nt/
mkdir -p $(pwd)/bear-b/day/ic/hdt/
mkdir -p $(pwd)/bear-b/day/ic/output/
mkdir -p $(pwd)/bear-b/day/ic/queries/
(cd $(pwd)/bear-b/day/ic/nt/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/datasets/day/IC/alldata.IC.nt.tar.gz && tar xf alldata.IC.nt.tar.gz && rm alldata.IC.nt.tar.gz && gzip -d *.nt.gz )
(cd $(pwd)/bear-b/day/ic/queries/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/p/p.txt && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/po/po.txt)
for f in $(pwd)/bear-b/day/ic/nt/*.nt
do
	input="$(pwd)/bear-b/day/ic/nt/$(basename $f)"
	output=$(pwd)/bear-b/day/ic/hdt/$(basename $f .nt)
	docker run -it --rm -v /home/lbiermann/phd/hdt_data/raw/:/input /home/lbiermann/phd/hdt_data/output:/output  rfdhdt/hdt-cpp rdf2hdt -i $input $output
done
