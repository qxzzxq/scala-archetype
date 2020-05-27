# scala-archetype
An up-to-date Maven Archetype for Scala with a bunch of out-of-the-box features 🍻

## Features
- [Scalatest](https://www.scalatest.org/) with [Scoverage](http://scoverage.org/) and [Surefire](https://maven.apache.org/surefire/maven-surefire-plugin/) report
- Maven central repository deployment
- [Apache Spark](https://spark.apache.org/)
- [Typesasfe config](https://github.com/lightbend/config)

## Usage

#### Interactive mode:
```shell script
mvn archetype:generate \
  -DarchetypeGroupId=dev.qinx \
  -DarchetypeArtifactId=scala-archetype \
  -DarchetypeVersion=0.0.1
```

#### Batch mode
```shell script
mvn archetype:generate -B \
  -DarchetypeGroupId=dev.qinx \
  -DarchetypeArtifactId=scala-archetype \
  -DarchetypeVersion=0.0.1 \
  -DgroupId=com.company \
  -DartifactId=artifact-id \
  -Dversion=0.0.1-SNAPSHOT \
  -Dpackage=com.company
```

#### Run test and generate report
The following command will run the unit test and generate test report.
```shell script
mvn scoverage:report
```
Surefire report will be put into `target/surefire-reports`.

Scoverage data and report could be found in:
- `target/scoverage-data`
- `target/site/scoverage`

#### Deploy to Maven Central Repository

Project created with this archetype is ready to be deployed to Maven Central Repository.
The only things you need to do are:
- prepare your `.m2/settings.xml`
  ```xml
  <settings>
    <profiles>
      <profile>
        <id>ossrh</id>
        <activation>
          <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
          <gpg.executable>gpg</gpg.executable>
          <gpg.passphrase>the_pass_phrase</gpg.passphrase>
        </properties>
      </profile>
    </profiles>
    <servers>
      <server>
        <id>ossrh</id>
        <username>your-jira-id</username>
        <password>your-jira-pwd</password>
      </server>
    </servers>
  </settings>
  ```
- prepare your GPG key
  ```shell script
  gpg --import private.key
  ```

Then, use the following command to deploy the artifact:
```shell script
# SNAPSHOT
mvn deploy -Psnapshot

# RELEASE
mvn deploy -Prelease
```


