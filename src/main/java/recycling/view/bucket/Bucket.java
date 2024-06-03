package recycling.view.bucket;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oracle.bmc.Region;
import com.oracle.bmc.ConfigFileReader;
import com.oracle.bmc.ConfigFileReader.ConfigFile;
import com.oracle.bmc.auth.AuthenticationDetailsProvider;
import com.oracle.bmc.auth.ConfigFileAuthenticationDetailsProvider;
import com.oracle.bmc.objectstorage.ObjectStorage;
import com.oracle.bmc.objectstorage.ObjectStorageClient;
import com.oracle.bmc.objectstorage.model.CreatePreauthenticatedRequestDetails;
import com.oracle.bmc.objectstorage.model.CreatePreauthenticatedRequestDetails.AccessType;
import com.oracle.bmc.objectstorage.requests.CreatePreauthenticatedRequestRequest;
import com.oracle.bmc.objectstorage.requests.DeleteObjectRequest;
import com.oracle.bmc.objectstorage.requests.DeletePreauthenticatedRequestRequest;
import com.oracle.bmc.objectstorage.requests.GetBucketRequest;
import com.oracle.bmc.objectstorage.requests.GetNamespaceRequest;
import com.oracle.bmc.objectstorage.requests.GetObjectRequest;
import com.oracle.bmc.objectstorage.requests.GetPreauthenticatedRequestRequest;
import com.oracle.bmc.objectstorage.requests.PutObjectRequest;
import com.oracle.bmc.objectstorage.responses.CreatePreauthenticatedRequestResponse;
import com.oracle.bmc.objectstorage.responses.GetBucketResponse;
import com.oracle.bmc.objectstorage.responses.GetNamespaceResponse;
import com.oracle.bmc.objectstorage.responses.GetObjectResponse;
import com.oracle.bmc.objectstorage.responses.GetPreauthenticatedRequestResponse;
import com.oracle.bmc.objectstorage.transfer.DownloadConfiguration;
import com.oracle.bmc.objectstorage.transfer.DownloadManager;
import com.oracle.bmc.objectstorage.transfer.UploadConfiguration;
import com.oracle.bmc.objectstorage.transfer.UploadManager;
import com.oracle.bmc.objectstorage.transfer.UploadManager.UploadRequest;
import com.oracle.bmc.objectstorage.transfer.UploadManager.UploadResponse;

public class Bucket {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void readBucket() throws Exception {
		final String compartmentId = "ocid1.bucket.oc1.ap-chuncheon-1.aaaaaaaaoamsunldliuud55f6tme3dljfjybs2b7grd2hipcebbnr45evi5q";
		final String bucket = "bucket-20240523-1355";
		final String object = "";
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		logger.info("Getting the namespace");
		GetNamespaceResponse namespaceResponse = client.getNamespace(GetNamespaceRequest.builder().build());
		
		String namespaceName = namespaceResponse.getValue();
		
		logger.info("Creating Get Bucket Request");
		
		List<GetBucketRequest.Fields> fieldList = new ArrayList<>(2);
		fieldList.add(GetBucketRequest.Fields.ApproximateCount);
		fieldList.add(GetBucketRequest.Fields.ApproximateSize);
		
		GetBucketRequest request = GetBucketRequest.builder().namespaceName(namespaceName).bucketName(bucket).fields(fieldList).build();
		
		logger.info("Fetching Bucket Details");
		GetBucketResponse response = client.getBucket(request);
		
		logger.info("Bucket Name : {}", response.getBucket().getName());
		logger.info("Bucket Compartment : {}", response.getBucket().getCompartmentId());
		
		logger.info("Bucket Name : {}", response.getBucket().getName());
		logger.info("Bucket Compartment : {}", response.getBucket().getCompartmentId());
		logger.info("{}, {}", response.getBucket().getApproximateCount(), response.getBucket().getApproximateSize());
		
	}
	
	public void UploadImg(String storedName, String originName) throws Exception {
		logger.info("uploadImg()");
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		UploadConfiguration uploadConfiguration = UploadConfiguration.builder().allowMultipartUploads(true).allowParallelUploads(true).build();
		
		UploadManager uploadManager = new UploadManager(client, uploadConfiguration);
		
		String namespaceName = "axqxukheyvt6";
		String bucketName = "bucket-20240523-1355";
		String objectName = storedName;
		Map<String, String> metadata = null;
		String contentType = "image/" + storedName.split("[.]")[1];
		
		String contentEncoding = null;
		String contentLanguage = null;
		
		File file = new File("");
		
		PutObjectRequest request = PutObjectRequest.builder()
									.bucketName(bucketName)
									.namespaceName(namespaceName)
									.objectName(objectName)
									.contentType(contentType)
									.contentLanguage(contentLanguage)
									.contentEncoding(contentEncoding)
									.opcMeta(metadata)
									.build();
	
		UploadRequest uploadDetails = UploadRequest.builder(file).allowOverwrite(true).build(request);
		
		UploadResponse response = uploadManager.upload(uploadDetails);
		logger.info("response : {}", response);
		
		client.close();
	}
	
	public void getImgOne(String storedName, String originName) throws Exception {
		logger.info("getImgOne()");
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		String namespaceName = "axqxukheyvt6";
		String bucketName = "bucket-20240523-1355";
		String objectName = storedName;
		
		GetObjectRequest request = GetObjectRequest.builder()
									.namespaceName(namespaceName)
									.bucketName(bucketName)
									.objectName(objectName)
									.build();
		
		GetObjectResponse response = client.getObject(request);
		logger.info("response : {}", response);
		response.getInputStream();
		
		client.close();
	}
	
	public void downloadImg(String storedName, String originName) throws Exception {
		logger.info("downloadImg()");
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		DownloadConfiguration downloadConfiguration = DownloadConfiguration.builder()
														.parallelDownloads(3)
														.maxRetries(3)
														.multipartDownloadThresholdInBytes(10 * 1024)
														.partSizeInBytes(5 * 1024)
														.build();
		DownloadManager downloadManager = new DownloadManager(client, downloadConfiguration);
		
		String namespaceName = "axqxukheyvt6";
		String bucketName = "bucket-20240523-1355";
		String objectName = storedName;
		String outputFileName = "";
		
		GetObjectRequest request = GetObjectRequest.builder()
									.namespaceName(namespaceName)
									.bucketName(bucketName)
									.objectName(objectName)
									.build();

		GetObjectResponse response = downloadManager.getObject(request);
		
		InputStream stream = response.getInputStream();
		OutputStream out = new FileOutputStream(outputFileName);
		
		try {
			byte[] buf = new byte[8192];
			int bytesRead;
			while((bytesRead = stream.read(buf)) > 0) {
				out.write(buf, 0, bytesRead);
			}			
		} finally {
			stream.close();
			out.close();
		}
		
		response = downloadManager.downloadObjectToFile(request, new File(outputFileName));
		
		client.close();
	}
	
	public void deleteImg(String storedName) throws Exception {
		logger.info("deleteImg()");
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		String namespaceName = "axqxukheyvt6";
		String bucketName = "bucket-20240523-1355";
		String objectName = storedName.split("[.]")[0];
		
		DeleteObjectRequest request = DeleteObjectRequest.builder()
										.bucketName(bucketName)
										.namespaceName(namespaceName)
										.objectName(objectName)
										.build();
		client.deleteObject(request);
		client.close();
	}
	
	public void getPreAuth() throws Exception {
		logger.info("getPreAuth()");
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		String namespaceName = "axqxukheyvt6";
		String bucketName = "bucket-20240523-1355";
		
		GetPreauthenticatedRequestRequest request = GetPreauthenticatedRequestRequest.builder()
														.namespaceName(namespaceName)
														.bucketName(bucketName)
														.parId("preAuth")
														.build();
		
		GetPreauthenticatedRequestResponse response = client.getPreauthenticatedRequest(request);
	}
	
	public void createPreAuth() throws Exception {
		logger.info("createPreAuth()");
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		String namespaceName = "axqxukheyvt6";
		String bucketName = "bucket-20240523-1355";
		
		Date expireDate = new Date();
		
		CreatePreauthenticatedRequestDetails details = CreatePreauthenticatedRequestDetails.builder()
														.accessType(AccessType.AnyObjectRead)
														.name("Recycling")
														.timeExpires(expireDate)
														.build();
		
		CreatePreauthenticatedRequestRequest request = CreatePreauthenticatedRequestRequest.builder()
														.namespaceName(namespaceName)
														.bucketName(bucketName)
														.createPreauthenticatedRequestDetails(details)
														.build();
		
		CreatePreauthenticatedRequestResponse response = client.createPreauthenticatedRequest(request);
		
		client.close();
	}
	
	public void deletePreAuth() throws Exception {
logger.info("createPreAuth()");
		
		ConfigFile config = ConfigFileReader.parse("~/ocikey/config", "DEFAULT");
		AuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(config);
		
		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_CHUNCHEON_1);
		
		String namespaceName = "axqxukheyvt6";
		String bucketName = "bucket-20240523-1355";
		
		DeletePreauthenticatedRequestRequest request = DeletePreauthenticatedRequestRequest.builder()
														.namespaceName(namespaceName)
														.bucketName(bucketName)
														.parId("preAuth")
														.build();
	}
}
