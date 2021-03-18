package kr.or.ddit.scheduler;

import java.io.File;

import kr.or.ddit.service.BoardService;
import kr.or.ddit.service.PdsService;

public class FileRemoveScheduler {

	private BoardService boardService;
	private PdsService pdsService;
	private String filePath;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	public void setPdsService(PdsService pdsService) {
		this.pdsService = pdsService;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public void fileRemove() throws Exception {
		
//		System.out.println("scheduled file remove~");
		
		boolean existFile = false;
		
		File dir = new File(filePath);
		File[] files = dir.listFiles();
		if(files!=null) {
			for(File file : files) {
				existFile = false;
				
				if(boardService.findBoard(file.getName())!=null) existFile=existFile||true;
				if(pdsService.findPds(file.getName())!=null) existFile=existFile||true;
				
				if(existFile) {
					System.out.println(file.getName() + " 파일은 존재합니다.");
					continue;
				}else {
					System.out.println(file.getName() + " 파일은 존재하지 않습니다. 삭제합니다.");
					file.delete();
				}
			}
		}
	}
	
}
