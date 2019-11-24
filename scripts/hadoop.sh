wget http://apache-mirror.8birdsvideo.com/hadoop/common/hadoop-3.1.3/hadoop-3.1.3.tar.gz
tar zvxf hadoop-3.1.3.tar.gz

echo \
'<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
<property>
<name>fs.default.name</name>
<value>hdfs://node0:9000</value>
</property>
</configuration>' > hadoop-3.1.3/etc/hadoop/core-site.xml

echo \
'<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
<property>
<name>dfs.namenode.name.dir</name>
<value>hadoop-3.1.2/data/namenode/</value>
</property>
<property>
<name>dfs.datanode.data.dir</name>
<value>hadoop-3.1.2/data/datanode/</value>
</property>
</configuration>' > hadoop-3.1.3/etc/hadoop/hdfs-site.xml


echo "node1
node2" > hadoop-3.1.3/etc/hadoop/workers

echo \
'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre' >> hadoop-3.1.3/etc/hadoop/hadoop-env.sh