mkdir -p $(pwd)/bear-b/day/ic/nt/
mkdir -p $(pwd)/bear-b/day/tbd/ic
mkdir -p $(pwd)/output/
mkdir -p $(pwd)/queries/
(cd $(pwd)/bear-b/day/ic/nt/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/datasets/day/IC/alldata.IC.nt.tar.gz && tar xf alldata.IC.nt.tar.gz && rm alldata.IC.nt.tar.gz && gzip -d *.nt.gz )
(cd $(pwd)/queries/ && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/p/p.txt && wget https://aic.ai.wu.ac.at/qadlod/bear/BEAR_B/Queries/po/po.txt)
wget http://mirror.metrocast.net/apache/jena/binaries/apache-jena-3.16.0.tar.gz && tar xf  apache-jena-3.16.0.tar.gz && rm apache-jena-3.16.0.tar.gz
for f in $(pwd)/bear-b/day/ic/nt/*.nt
do
	version=$(expr $(basename $f .nt) + 0)
	mkdir -p $(pwd)/bear-b/day/tbd/ic/$version/
  $(pwd)/apache-jena-3.16.0/bin/tdbloader2 --loc $(pwd)/bear-b/day/tbd/ic/$version/ $f
done
