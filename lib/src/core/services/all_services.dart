// part 'admin_service.g.dart';

// abstract class AdminService {
//   // @factoryMethod
//   // factory AdminService(Dio dio, @Named('baseUrl') String baseUrl) = _AdminService;

//   // Admin/Auth/login
//   @POST(ApiEndPoints.login)
//   Future<ApiResponse<bool>> login(@Body() Map<String, dynamic> body);

//   // Admin/Auth/logout
//   @POST(ApiEndPoints.logout)
//   Future<ApiResponse<bool>> logout(@Body() Map<String, dynamic> body);

//   // Admin/Users/createAccount
//   @POST(ApiEndPoints.createWorker)
//   Future<ApiResponse<bool>> createaccount(@Body() Map<String, dynamic> body);

//   // Admin/Users/updateUser
//   @PUT(ApiEndPoints.updateWorker)
//   Future<ApiResponse<bool>> updateuser(
//     @Path() String id,
//     @Body() Map<String, dynamic> body,
//   );

//   // Admin/Users/getAllUsers
//   @POST(ApiEndPoints.getallusers)
//   Future<ApiResponse<bool>> getallusers(@Body() Map<String, dynamic> body);

//   // Admin/Users/deleteUser
//   @DELETE(ApiEndPoints.deleteWorker)
//   Future<ApiResponse<bool>> deleteuser(@Path() String id);

//   // Admin/Sector/Create sector
//   @POST(ApiEndPoints.createSector)
//   Future<ApiResponse<bool>> createSector(@Body() Map<String, dynamic> body);

//   // Admin/Sector/Update sector
//   @PUT(ApiEndPoints.updateSector)
//   Future<ApiResponse<bool>> updateSector(
//     @Path() String id,
//     @Body() Map<String, dynamic> body,
//   );

//   // Admin/Sector/Get All sectors
//   @GET(ApiEndPoints.getAllSectors)
//   Future<ApiResponse<bool>> getAllSectors();

//   // Admin/Sector/Get sector By Id
//   @GET(ApiEndPoints.getSectorById)
//   Future<ApiResponse<bool>> getSectorById();

//   // Admin/Sector/getDepartmentsBySector
//   @GET(ApiEndPoints.getdepartmentsbysector)
//   Future<ApiResponse<bool>> getdepartmentsbysector();

//   // Admin/Sector/Delete Sector
//   @DELETE(ApiEndPoints.deleteSector)
//   Future<ApiResponse<bool>> deleteSector(@Path() String id);

//   // Admin/Department/Create Department
//   @POST(ApiEndPoints.createDepartment)
//   Future<ApiResponse<bool>> createDepartment(@Body() Map<String, dynamic> body);

//   // Admin/Department/Update Department
//   @PUT(ApiEndPoints.updateDepartment)
//   Future<ApiResponse<bool>> updateDepartment(
//     @Path() String id,
//     @Body() Map<String, dynamic> body,
//   );

//   // Admin/Department/Get All Departments
//   @GET(ApiEndPoints.getAllDepartments)
//   Future<ApiResponse<bool>> getAllDepartments();

//   // Admin/Department/Get Department By Id
//   @GET(ApiEndPoints.getDepartmentById)
//   Future<ApiResponse<bool>> getDepartmentById();

//   // Admin/Department/Delete Department
//   @DELETE(ApiEndPoints.deleteDepartment)
//   Future<ApiResponse<bool>> deleteDepartment(@Path() String id);

//   // Admin/Home/getHomeStatistics
//   @GET(ApiEndPoints.gethomestatistics)
//   Future<ApiResponse<bool>> gethomestatistics();

//   // Admin/Home/getHomeSectors
//   @GET(ApiEndPoints.gethomesectors)
//   Future<ApiResponse<bool>> gethomesectors();

//   // Admin/Daily Works/create Daily Work
//   @POST(ApiEndPoints.createDailyWork)
//   Future<ApiResponse<bool>> createDailyWork(@Body() Map<String, dynamic> body);

//   // Admin/Daily Works/updateDailyWork
//   @PUT(ApiEndPoints.updatedailywork)
//   Future<ApiResponse<bool>> updatedailywork(
//     @Path() String id,
//     @Body() Map<String, dynamic> body,
//   );

//   // Admin/Daily Works/getAllDailyWorks
//   @GET(ApiEndPoints.getalldailyworks)
//   Future<ApiResponse<bool>> getalldailyworks();

//   // Admin/Daily Works/getAllDailyWorks Copy
//   @DELETE(ApiEndPoints.getalldailyworksCopy)
//   Future<ApiResponse<bool>> getalldailyworksCopy(@Path() String id);

//   // Admin/Daily Works/getLastDailyWork
//   @GET(ApiEndPoints.getLastDailyWork)
//   Future<ApiResponse<bool>> getlastdailywork();

//   // Admin/Daily Works/getDailyWork
//   @GET(ApiEndPoints.getdailywork)
//   Future<ApiResponse<bool>> getdailywork();
// }
