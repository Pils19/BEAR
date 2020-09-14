mkdir -p $(pwd)/bear-b/day/cb/nt/
mkdir -p $(pwd)/bear-b/day/cb/hdt/
mkdir -p $(pwd)/bear-b/day/cb/output/
mkdir -p $(pwd)/bear-b/day/cb/queries/
(cd $(pwd)/bear-b/day/cb/nt/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/datasets/day/CB/alldata.CB.nt.tar.gz && tar xf alldata.CB.nt.tar.gz && rm alldata.CB.nt.tar.gz && gzip -d *.nt.gz )
(cd $(pwd)/bear-b/day/cb/queries/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/p/p.txt && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/po/po.txt)
for f in $(pwd)/bear-b/day/cb/nt/data-added*.nt
do
	input="/input/$(basename $f)"
	out_file=${$(basename $f .nt)#"data-added"}
	output=/output/$out_file.add.hdt
	docker run -it --rm -v $(pwd)/bear-b/day/ic/nt/:/input -v $(pwd)/bear-b/day/ic/hdt/:/output rfdhdt/hdt-cpp rdf2hdt -i $input $output
done
