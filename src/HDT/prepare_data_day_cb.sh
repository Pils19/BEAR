mkdir -p $(pwd)/bear-b/day/cb/nt/
mkdir -p $(pwd)/bear-b/day/cb/hdt/
mkdir -p $(pwd)/bear-b/day/cb/output/
mkdir -p $(pwd)/bear-b/day/cb/queries/
(cd $(pwd)/bear-b/day/cb/nt/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/datasets/day/CB/alldata.CB.nt.tar.gz && tar xf alldata.CB.nt.tar.gz && rm alldata.CB.nt.tar.gz && gzip -d *.nt.gz )
(cd $(pwd)/bear-b/day/cb/queries/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/p/p.txt && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/po/po.txt)
for f in $(pwd)/bear-b/day/cb/nt/data-added*.nt
do
	input="/input/$(basename $f)"
	out_file=$(basename $f .nt)
	out_file_stripped=${out_file#"data-added_"}
	output=/output/${out_file_stripped%-*}.add.hdt
	docker run --rm -v $(pwd)/bear-b/day/cb/nt/:/input -v $(pwd)/bear-b/day/cb/hdt/:/output rfdhdt/hdt-cpp rdf2hdt -i $input $output
done
for f in $(pwd)/bear-b/day/cb/nt/data-deleted*.nt
do
	input="/input/$(basename $f)"
	out_file=$(basename $f .nt)
	out_file_stripped=${out_file#"data-deleted_"}
	output=/output/${out_file_stripped%-*}.del.hdt
	docker run --rm -v $(pwd)/bear-b/day/cb/nt/:/input -v $(pwd)/bear-b/day/cb/hdt/:/output rfdhdt/hdt-cpp rdf2hdt -i $input $output
done
