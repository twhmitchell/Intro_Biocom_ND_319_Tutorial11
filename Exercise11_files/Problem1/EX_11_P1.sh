#!/usr/bin/env bash


../../../../Downloads/muscle3.8.31_i86darwin64 -in sigma.ref -out sigma.align
 ../../../../Downloads/muscle3.8.31_i86darwin64 -in sporecoat.ref -out sporecoat.align
../../../../Downloads/muscle3.8.31_i86darwin64 -in transporter.ref -out transporter.align

/Users/sampathkumarbalaji/Downloads/hmmer-3.1b2-macosx-intel/binaries/hmmbuild sigma.hmm sigma.align
/Users/sampathkumarbalaji/Downloads/hmmer-3.1b2-macosx-intel/binaries/hmmbuild sporecoat.hmm sporecoat.align
/Users/sampathkumarbalaji/Downloads/hmmer-3.1b2-macosx-intel/binaries/hmmbuild transporter.hmm transporter.align

for f in *.fasta
do
	/Users/sampathkumarbalaji/Downloads/hmmer-3.1b2-macosx-intel/binaries/hmmsearch --tblout sigma.hits sigma.hmm $f
	echo "$f"
	cat sigma.hits | grep -v "#" | awk '{print substr($1,length($1)-3),$3,$5}' >> ouput.table
done

for f in *.fasta
do
        /Users/sampathkumarbalaji/Downloads/hmmer-3.1b2-macosx-intel/binaries/hmmsearch --tblout sporecoat.hits sporecoat.hmm $f
        echo "$f"
        cat sporecoat.hits | grep -v "#" | awk '{print substr($1,length($1)-3),$3,$5}' >> ouput.table
done

for f in *.fasta
do
        /Users/sampathkumarbalaji/Downloads/hmmer-3.1b2-macosx-intel/binaries/hmmsearch --tblout transporter.hits transporter.hmm $f
        echo "$f"
        cat transporter.hits | grep -v "#" | awk '{print substr($1,length($1)-3),$3,$5}' >> ouput.table
done
