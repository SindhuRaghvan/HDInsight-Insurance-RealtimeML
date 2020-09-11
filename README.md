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

In this example, we can see how to Perform ML modeling on Spark and perform real time inference on streaming data from Kafka on HDInsight. We are deploying HDInsight 4.0 with Spark 2.4 to implement Spark Streaming

__NOTE__: Apache Kafka and Spark are available as two different cluster types. HDInsight cluster types are tuned for the performance of a specific technology; in this case, Kafka and Spark. To use both together, you must create an Azure Virtual network and then create both a Kafka and Spark cluster on the virtual network. For an example of how to do this using an Azure Resource Manager template, see `modular-template.json` file in the ARM-Template folder of this project. To use this template to create Azure resources, use the following button:

Use the following button to sign in to Azure and open the template in the Azure portal:
    
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSindhuRaghvan%2FHDInsight-Insurance-RealtimeML%2Fmaster%2FARM-Template%2Fmodular-template.json)  
This template creates an Azure Virtual Network, Kafka on HDInsight 3.6, and Spark 2.4.0 on HDInsight 4.0.

# Understand the Usecase

**Use Case:** 

Insurance companies use multiple inputs including individual/enterprise history, market conditions, competitor analysis, previous claims, local demographics, weather conditions, regional traffic data and other external/internal sources to identify the risk category of a potential customer. These inputs can come from multiple sources at very different intervals. 

Let’s deploy a scenario in which we use historic data to create ML models on Spark, and as new requests come in from Insurance users or the agents, we evaluate the users in **real time** and predict whether they are likely to be in a crash and how much would their next claim be, if they’re likely to be in a crash.

## Architecture

The architetcure we're deploying today is 
![Architecture](https://raw.githubusercontent.com/SindhuRaghvan/HDInsight-Insurance-RealtimeML/master/images/Final_Architecture.svg)


