package com.tjoeun.ilsan.board.free.dao;

import java.util.List;
import java.util.Map;

public interface FreeBoardDao {
	
	public List<Map> select();
	
	public int write(Map map);

}
