// class ApiEndPoints {
//   // Admin/Auth/login
//   static const String login = 'login';
//   // Admin/Auth/logout
//   static const String logout = 'logout';
//   // Admin/Users/createAccount
//   static const String createWorker = 'createAccount';
//   // Admin/Users/updateUser
//   static const String updateWorker = 'updateUser';
//   // Admin/Users/getAllUsers
//   static const String getallusers = 'getAllUsers';
//   // Admin/Users/deleteUser
//   static const String deleteWorker = 'deleteUser';
//   // Admin/Sector/Create sector
//   static const String createSector = 'sectors';
//   // Admin/Sector/Update sector
//   static const String updateSector = 'sectors';
//   // Admin/Sector/Get All sectors
//   static const String getAllSectors = 'sectors';
//   // Admin/Sector/Get sector By Id
//   static const String getSectorById = 'sectors';
//   // Admin/Sector/getDepartmentsBySector
//   static const String getdepartmentsbysector = 'sectors/1/departments';
//   // Admin/Sector/getSectorContent
//   static const String getSectorContent = 'getSectorContent';
//   // Admin/Sector/Delete Sector
//   static const String deleteSector = 'sectors';
//   // Admin/Department/Create Department
//   static const String createDepartment = 'departments';
//   // Admin/Department/Update Department
//   static const String updateDepartment = 'departments';
//   // Admin/Department/Get All Departments
//   static const String getAllDepartments = 'departments';
//   // Admin/Department/Get Department By Id
//   static const String getDepartmentById = 'departments/1';
//   // Admin/Department/Delete Department
//   static const String deleteDepartment = 'departments';
//   // Admin/Home/getHomeStatistics
//   static const String gethomestatistics = 'getHomeStatistics';
//   // Admin/Home/getHomeSectors
//   static const String gethomesectors = 'getHomeSectors';
//   // Admin/Daily Works/create Daily Work
//   static const String createDailyWork = 'AddDailyWork';
//   // Admin/Daily Works/updateDailyWork
//   static const String updatedailywork = 'updateDailyWork/5';
//   // Admin/Daily Works/getAllDailyWorks
//   static const String getalldailyworks = 'getAllDailyWorks';
//   // Admin/Daily Works/getAllDailyWorks Copy
//   static const String getalldailyworksCopy = 'deletDeailyWork/5';
//   // Admin/Daily Works/getLastDailyWork
//   static const String getLastDailyWork = 'getLastDailyWork';
//   // Admin/Daily Works/getDailyWork
//   static const String getdailywork = 'getDailyWork/4';
//   // Admin/Filters/getUsersFilters
//   static const String getSectorsAndRoles = 'getUsersFilters';
//   // Admin/Sector/getSectorContent
//   static const String getsectorcontent = 'getSectorContent';
//   // Admin/Sector/getAllSectorsContent
//   static const String getAllSectorsContent = 'getAllSectorsContent';
//   // Admin/Department/getAllDepartmentsContent
//   static const String getAllDepartmentsContent = 'getAllDepartmentsContent';
//   static const String searchWorker = 'searchUser';
//   //Admin/Sector/getSectorStatistics
//   static const String getSectorStatistics = 'getSectorStatistics';

//   static const String getDailyWorksBySector = 'getDailyWorksBySector';

//   //Farm / Admin / Setting / getSetting
//   static const String getSetting = 'getSetting';
//   //Farm / Admin / Setting / updateSetting
//   static const String updateSetting = 'updateSetting';
// }

class ApiEndPoints {
  // Admin
  // Admin/Auth
  // Admin/Auth/logout
  static const String logout = 'logout';
  // Admin/Auth/login
  static const String login = 'login';
  // Admin/Users
  // Admin/Users/createAccount
  static const String createAccount = 'createAccount';
  // Admin/Users/updateUser
  static const String updateUser = 'updateUser/{id}';
  // Admin/Users/getAllUsers
  static const String getAllUsers = 'getAllUsers';
  // Admin/Users/searchUser
  static const String searchUser = 'searchUser';
  // Admin/Users/deleteUser
  static const String deleteUser = 'deleteUser/{id}';
  // Admin/Sector
  // Admin/Sector/Create sector
  static const String createSector = 'sectors';
  // Admin/Sector/Update sector
  static const String updateSector = 'sectors/{id}';
  // Admin/Sector/Get All sectors
  static const String getAllSectors = 'sectors';
  // Admin/Sector/getSectorContent
  static const String getSectorContent = 'getSectorContent';
  // Admin/Sector/getAllSectorsContent
  static const String getAllSectorsContent = 'getAllSectorsContent';
  // Admin/Sector/getDepartmentsBySector
  static const String getDepartmentsBySector = 'sectors/{id}/departments';
  // Admin/Sector/Delete Sector
  static const String deleteSector = 'sectors/{id}';
  // Admin/Sector/getSectorStatistics
  static const String getSectorStatistics = 'getSectorStatistics';
  // Admin/Sector/getAllSectors
  static const String getAllBasicsSectors = 'getAllSectors';
  // Admin/Sector/getSectorType
  static const String getSectorType = 'getSectorType';
  // Admin/Department
  // Admin/Department/Create Department
  static const String createDepartment = 'departments';
  // Admin/Department/Update Department
  static const String updateDepartment = 'departments/{id}';
  // Admin/Department/Get All Departments
  static const String getAllDepartments = 'departments';
  // Admin/Department/getAllDepartmentsContent
  static const String getAllDepartmentsContent = 'getAllDepartmentsContent';
  // Admin/Department/Get Department By Id
  static const String getDepartmentById = 'departments/{id}';
  // Admin/Department/Delete Department
  static const String deleteDepartment = 'departments/{id}';
  // Admin/Department/getDepartmentBySectorId
  static const String getDepartmentBySectorId = 'getDepartmentBySectorId/{id}';
  // Admin/Home
  // Admin/Home/getHomeStatistics
  static const String getHomeStatistics = 'getHomeStatistics';
  // Admin/Home/getHomeSectors
  static const String getHomeSectors = 'getHomeSectors';
  // Admin/Daily Works
  // Admin/Daily Works/create Daily Work
  static const String createDailyWork = 'AddDailyWork';
  // Admin/Daily Works/updateDailyWork
  static const String updateDailyWork = 'updateDailyWork/{id}';
  // Admin/Daily Works/getAllDailyWorks
  static const String getAllDailyWorks = 'getAllDailyWorks';
  // Admin/Daily Works/deletDeailyWork
  static const String deletDeailyWork = 'deletDeailyWork/{id}';
  // Admin/Daily Works/getLastDailyWork
  static const String getLastDailyWork = 'getLastDailyWork';
  // Admin/Daily Works/getDailyWork
  static const String getDailyWork = 'getDailyWork/{id}';
  // Admin/Daily Works/getAllStatuses
  static const String getAllStatuses = 'getAllStatuses';
  // Admin/Daily Works/getAllTypes
  static const String getAllTypes = 'getAllTypes';
  // Admin/Daily Works/getDailyWorksBySector
  static const String getDailyWorksBySector = 'getDailyWorksBySector';
  // Admin/Filters
  // Admin/Filters/getUsersFilters
  static const String getUsersFilters = 'getUsersFilters';
  // Admin/Filters/getSectorFilters
  static const String getSectorFilters = 'getSectorFilters';
  // Admin/Setting
  // Admin/Setting/getSetting
  static const String getSetting = 'getSetting';
  // Admin/Setting/updateSetting
  static const String updateSetting = 'updateSetting';
  // Admin/Reports
  // Admin/Reports/getAllReports
  static const String getAllReports = 'getAllReports';
  static const String updateIsRead = 'updateIsRead';
  static const String fetchSectorReports = 'fetchSectorReports';

  // Admin/StoreHouse
  // Admin/StoreHouse/getWareHouseFilters
  static const String getWareHouseFilters = 'getWarehouseContentFilter';
  // Admin/Tree
  // Admin/Tree/getTreeByDepartmentId
  static const String getTreeByDepartmentId = 'getTreeByDepartmentId/{id}';
  // Admin/Tree/addTrees
  static const String addTrees = 'addTrees';
  // Admin/Tree/editTree
  static const String editTree = 'editTree/{id}';
  // Admin/Tree/deleteTree
  static const String deleteTree = 'deleteTree/{id}';
  // Admin/Animal
  // Admin/Animal/getAnimalByDepartmentId
  static const String getAnimalByDepartmentId = 'getAnimalByDepartmentId/{id}';
  // Admin/Animal/addAnimal
  static const String addAnimal = 'addAnimal';
  // Admin/Animal/updateAnimal
  static const String editAnimal = 'editAnimal/{id}';
  // Admin/Animal/deleteAnimal
  static const String deleteAnimal = 'deleteAnimal/{id}';
  // Admin/Tools
  // Admin/Tools/getAllTools
  static const String getAllTools = 'getAllTools';
  // Admin/Tools/getTool
  static const String getTool = 'getTool/{id}';
  // Admin/Tools/addTool
  static const String addTool = 'addTool';
  // Admin/Tools/editTool
  static const String updateTool = 'updateTool/{id}';
  // Admin/Tools/deleteTool
  static const String deleteTool = 'deleteTool/{id}';

  /// #Machine
  static const String addMachine = '/addMachine';
  static const String updateMachine = '/updateMachine/{id}';
  static const String deleteMachine = '/deleteMachine/{id}';

  /// #Material
  static const String addMaterial = '/addMaterial';
  static const String updateMaterial = '/updateMaterial/{id}';
  static const String deleteMaterial = '/deleteMaterial/{id}';

  /// #Seeds
  static const String addSeeds = '/addSeeds';
  static const String updateSeeds = '/updateSeeds/{id}';
  static const String deleteSeeds = '/deleteSeeds/{id}';
  static const String getAllWarehouseContent = '/getAllWarehouseContent';
  static const String getWarningWarehouse = '/getWarningWarehouse';

  static const String changeWarningVisibility = '/changeWarningVisibility/{id}';
  static const String getUserNotifications = '/getUserNotifications';
  static const String fetchPlantTypes = 'fetchPlantTypes';
  static const String showStatusTree = 'showStatusTree';
  static const String fetchPlantTypeSpecies = 'showSpeciesTree';
  static const String fetchAnimalTypeSpecies = '/showSpeciesAnimal';
  static const String fetchPlantGeneralGenderTypes =
      '/getGenderTypesByTreeType';
  static const String fetchAnimalTypes = '/fetchAnimalTypes';
  static const String showStatusAnimal = '/showStatusAnimal';
  static const String fetchAnimalGenderTypes = '/getGenderTypesByAnimalType';

  // Productivity Cycles
  static const String getLastThreeCyclesWithTransactions =
      '/getLastThreeCyclesWithTransactions';
  static const String addProductionCycle = '/addProductionCycle';
  static const String updateTransaction = '/updateTransaction/{id}';
  static const String deleteProductionCyclel = '/deleteProductionCyclel/{id}';
  static const String getAllProductionCycle = '/getAllProductionCycle';
  static const String addTransaction = '/addTransaction';
  static const String updateProductionCycle = '/updateProductionCycle/{id}';
  static const String deleteTransaction = '/deleteTransaction/{id}';
}
