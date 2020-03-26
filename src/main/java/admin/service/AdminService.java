package admin.service;

import java.util.List;

import admin.bean.Admin_dogiverPaging;
import blood.bean.DogiverDTO;

public interface AdminService {

	public List<DogiverDTO> getDogiver(String pg);

	public Admin_dogiverPaging admin_dogiverPaging(String pg);

}
