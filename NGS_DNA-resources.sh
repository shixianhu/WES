set -e 
set -u

module load NGS_DNA


DATADIR="$HOME/apps/data/"

### Getting Reference genome
printf "Getting Reference genome ..."

mkdir -p ${DATADIR}/1000G/phase1
cd ${DATADIR}/1000G/phase1

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37.dict.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37.dict.gz.md5

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37.fasta.fai.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37.fasta.fai.gz.md5

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37.fasta.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37.fasta.gz.md5

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37_decoy.dict.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37_decoy.dict.gz.md5

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37_decoy.fasta.fai.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37_decoy.fasta.fai.gz.md5

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37_decoy.fasta.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/human_g1k_v37_decoy.fasta.gz.md5

for i in $(ls ${DATADIR}/1000G/phase1/*.gz); do gzip -d $i ;done

## Create Bedfile directory
printf "make bedfile directory \n"
mkdir -p $DATADIR/Agilent/

## DbSNP
mkdir ${DATADIR}/dbSNP/
cd ${DATADIR}/dbSNP/
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/dbsnp_138.b37.vcf.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/dbsnp_138.b37.vcf.gz.md5

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/dbsnp_138.b37.vcf.idx.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle//b37/dbsnp_138.b37.vcf.idx.gz.md5

###inSilico
printf "Get inSilico data \n ... creating dir ${DATADIR}/inSilico.."

mkdir -p ${DATADIR}/inSilico

cd ${DATADIR}/inSilico
printf ".. unpack $EBROOTNGS_DNA/resources/inSilico.tar.gz .."

tar -zxvf $EBROOTNGS_DNA/resources/inSilico.tar.gz
printf " finished inSilico ..\n"

### HPO
printf "Get HPO data \n ... creating dir ${DATADIR}/HPO.."

mkdir -p ${DATADIR}/HPO/build.90
cd ${DATADIR}/HPO/build.90
printf ".. unpack $EBROOTNGS_DNA/resources/HPO.tar.gz .."

tar -zxvf $EBROOTNGS_DNA/resources/HPO.tar.gz
printf " finished HPO ..\n"
