datestamp=`date +%Y``date +%m``date +%d``date +%H``date +%M``date +%S`
adDomainUC="JRG.LAB"
adDomainLC="jrg.lab"
dcFQDN1="gb3gochjrgdc01.jrg.lab"
dcFQDN2="gb3gochjrgdc02.jrg.lab"


echo "Updating Kerberos Settings"
grep -q "$adDomainUC" /etc/krb5.conf
krbstatus=$?
#update kerberos file if not previously updated with this domain
if [ $krbstatus -ne 0 ]; then
   cp -fp /etc/krb5.conf /etc/krb5.conf.$datestamp
   cp -fp /etc/krb5.conf /etc/krb5.conf.new
   sed -i "/^ default_realm/c\\ default_realm = $adDomainUC" /etc/krb5.conf.new
   sed -i '/\[realms\]/,/\[domain_realm\]/{//!d}' /etc/krb5.conf.new
   sed -i '/example.com/d' /etc/krb5.conf.new
   sed -i "/\[realms\]/a\ $adDomainUC = \{\n   kdc = ${dcFQDN1^^}\n   kdc = ${dcFQDN2^^}\n   admin_server = ${dcFQDN1^^}\n \}\n" /etc/krb5.conf.new
   sed -i "/\[domain_realm\]/a\ .$adDomainLC = $adDomainUC\n $adDomainLC = $adDomainUC\n" /etc/krb5.conf.new
   \cp -fp /etc/krb5.conf.new /etc/krb5.conf
   rm -f /etc/krb5.conf.new
fi
