package com.tjoeun.ilsan.board.free.reply.sql;

import java.util.List;
import java.util.Map;

public interface FreeBoardRepMapper {
	
	public int insert(Map map);

	public List<Map> select(Map map);

}
