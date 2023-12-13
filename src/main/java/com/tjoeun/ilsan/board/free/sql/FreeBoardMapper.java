package com.tjoeun.ilsan.board.free.sql;

import java.util.List;
import java.util.Map;

public interface FreeBoardMapper {
	
	public List<Map> select();

	public int write(Map map);

}
