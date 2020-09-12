## HDInsight-Insurance-RealtimeML

---
products:
  - azure
  - azure-hdinsight
  - azure-SQL
  - Azure-Data-Factory
description: "This is a an example of running realtime inference on data streaming from Kafka on HDInsight into a Spark HDInsight cluster."
urlFragment: HDInsight-Insurance-RealtimeML
---

# HDInsight Realtime Inference

In this example, we can see how to Perform ML modeling on Spark and perform real time inference on streaming data from Kafka on HDInsight. We are deploying HDInsight 4.0 with Spark 2.4 to implement Spark Streaming and HDInsight 3.6 with Kafka

__NOTE__: Apache Kafka and Spark are available as two different cluster types. HDInsight cluster types are tuned for the performance of a specific technology; in this case, Kafka and Spark. To use both together, you must create an Azure Virtual network and then create both a Kafka and Spark cluster on the virtual network. For an example of how to do this using an Azure Resource Manager template, see `modular-template.json` file in the ARM-Template folder of this project. 

## Understanding the Usecase


Insurance companies use multiple inputs including individual/enterprise history, market conditions, competitor analysis, previous claims, local demographics, weather conditions, regional traffic data and other external/internal sources to identify the risk category of a potential customer. These inputs can come from multiple sources at very different intervals. 

Let’s deploy a scenario in which we use historic data to create ML models on Spark, and as new requests come in from Insurance users or the agents, we evaluate the users in **real time** and predict whether they are likely to be in a crash and how much would their next claim be, if they’re likely to be in a crash.

## Architecture

The architetcure we're deploying today is 
![Architecture](https://raw.githubusercontent.com/SindhuRaghvan/HDInsight-Insurance-RealtimeML/master/images/Final_Architecture.svg)


#### Data Flow:

**1**: Setup ADF to transfer historic data from Blob and other sources to ADLS  
**2**: Load historic data into ADLS storage that is associated with Spark HDInsight cluster using Azure Data Factory (In this example, we will simulate this step by transferring a csv file from a Blob Storage )  
**3**: Use Spark HDInsight cluster (HDI 4.0, Spark 2.4.0) to create ML models  
**4**: Save the models back in ADLS Gen2  
**5**: Kafka HDInsight will receive streaming requests for predictions (In this example, we are simulating streaming data in Kafka using a static file)  
**6**: Spark HDInsight cluster will receive the streaming records and infer predictions during runtime using models saved in ADLS Storage  
**7**: Once inference is done, Spark HDInsight cluster will write the files to both ADLS Storage in JSON format and SQL database into a pre-defined table  
**8**: Power BI can now access data from both SQL table and Spark Cluster into a dashboard for further analysis (NOTE: In this example, we only have SQL setup)  

# Let's get into it:

**Step 1:** Use the following button to sign in to Azure and open the template in the Azure portal:
    
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSindhuRaghvan%2FHDInsight-Insurance-RealtimeML%2Fmaster%2FARM-Template%2Fmodular-template.json)  

This template wil deploy all the resources seen in the architecture above 

_(Note: This deployment may take about 10-15 minutes. Wait until all the resources are deployed before moving to the next step)_

**Step 2:** Go to Azure Cloud Shell (either azure.shell.com or click on cloud shell ![iconicon](https://raw.githubusercontent.com/SindhuRaghvan/HDInsight-Insurance-RealtimeML/master/images/shell.svg) on portal.azure.com)  