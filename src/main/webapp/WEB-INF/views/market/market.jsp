<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta name="HandheldFriendly" content="true">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<title>멍냥 마켓</title>
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/default.css?ver=1934">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/skin/board/webzine/style.css?ver=171222">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/board.common.css?ver=1934">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/mobile.css?ver=1934">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/contents.css?ver=1934">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.css?ver=1934">
<!--[if lte IE 8]><script src="http://sample.paged.kr/purewhite/js/html5.js"></script><![endif]-->
<script>var g5_url = "http://sample.paged.kr/purewhite"; var g5_bbs_url = "http://sample.paged.kr/purewhite/bbs"; var g5_is_member = ""; var g5_is_admin = ""; var g5_is_mobile = ""; var g5_bo_table = "webzine"; var g5_sca = ""; var g5_editor = "smarteditor2"; var g5_cookie_domain = "";</script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/jquery-1.11.0.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/jquery.menu.min.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/js/common.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/WEBsiting.js?ver=221712222"></script>
<script src="http://sample.paged.kr/purewhite/js/wrest.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/js/placeholders.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/shuffleLetters/jquery.shuffleLetters.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.js"></script>
</head>

<body>
<div id="ctWrap">

	<div id="container">

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">


    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div id="bo_btn_top">
        <div id="bo_list_total">
            <span><i class="fa fa-file-o"></i> Total 51 /</span>
            1 page
        </div>

                <ul class="btn_bo_user">
           <li><a href="marketWrite" class="btn_b02 btn"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a></li>        </ul>
            </div>
    <!-- } 게시판 페이지 정보 및 버튼 끝 -->

    <!-- 게시판 카테고리 시작 { -->
        <!-- } 게시판 카테고리 끝 -->

    <form name="fboardlist" id="fboardlist" action="./board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post">
    <input type="hidden" name="bo_table" value="webzine">
    <input type="hidden" name="sfl" value="">
    <input type="hidden" name="stx" value="">
    <input type="hidden" name="spt" value="">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sst" value="wr_num, wr_reply">
    <input type="hidden" name="sod" value="">
    <input type="hidden" name="page" value="1">
    <input type="hidden" name="sw" value="">


    <h2 class="sound_only">웹진형게시판 목록</h2>
	    <div class="webzineList">
        <ul>
                <li class="bo_notice">
            			<!-- 이미지없음 -->
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=6" class="bo_tit">
				
				<strong class="notice_icon"><i class="fa fa-bullhorn" aria-hidden="true"></i><span class="sound_only">공지</span></strong>								<strong>웹진형 게시판 공지사항입니다.</strong>
			   
								<span class="sound_only">댓글</span><span class="cnt_cmt">+ 1</span><span class="sound_only">개</span>				
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 979</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                <li class="">
            			<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=8" class="list_img"><img src="http://sample.paged.kr/purewhite/data/file/webzine/thumb-31261188_zNdtK47q_61996a91b920d2640182db95d03b467679d606f7_200x200.jpg" alt=""></a>
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=8" class="bo_tit">
				
				<span class="sound_only">50</span>								<strong>웹진형 게시판입니다.</strong>
			   
				<i class="fa fa-download" aria-hidden="true"></i>								
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 810</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                <li class="">
            			<!-- 이미지없음 -->
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=7" class="bo_tit">
				
				<span class="sound_only">49</span>								<strong>웹진형 게시판입니다.</strong>
			   
												
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 617</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                <li class="">
            			<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=5" class="list_img"><img src="http://sample.paged.kr/purewhite/data/file/webzine/thumb-31261188_8E1gzTD3_37bcc79a8f274c5e7edf90473e29de6fdf817ded_200x200.jpg" alt=""></a>
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=5" class="bo_tit">
				
				<span class="sound_only">48</span>								<strong>웹진형 게시판입니다.</strong>
			   
				<i class="fa fa-download" aria-hidden="true"></i>								
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 721</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                <li class="">
            			<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=4" class="list_img"><i class="youtube_img"><sup style="background-image:URL(https://img.youtube.com/vi/FjU_x1106pg/sddefault.jpg" alt="웹진형 게시판에 유투브 영상 주소를 넣으면"></sup><sub><i class="imgAr"><img src="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/websiting/imageSpacer.php?w=200&amp;h=200" alt="youtube image spacer"></i></sub></i></a>
					
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=4" class="bo_tit">
				
				<span class="sound_only">47</span>								<strong>웹진형 게시판에 유투브 영상 주소를 넣으면</strong>
			   
				<i class="fa fa-link" aria-hidden="true"></i><i class="fa fa-youtube-play fts13px"><span class="sound_only">유투브영상</span></i> 								
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 547</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                <li class="">
            			<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=3" class="list_img"><img src="http://sample.paged.kr/purewhite/data/file/webzine/thumb-31261188_lz6CG7QJ_a325778a52da38f42cc1a968c0b26e3af5f7d3ef_200x200.jpg" alt=""></a>
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=3" class="bo_tit">
				
				<span class="sound_only">46</span>								<strong>웹진형 게시판입니다.</strong>
			   
				<i class="fa fa-download" aria-hidden="true"></i>								
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 518</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                <li class="">
            			<!-- 이미지없음 -->
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=2" class="bo_tit">
				
				<span class="sound_only">45</span>								<strong>웹진형 게시판입니다.</strong>
			   
												
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 495</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                <li class="">
            			<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=1" class="list_img"><img src="http://sample.paged.kr/purewhite/data/file/webzine/thumb-31261188_KIU3dZYs_f66888d88240e26d284f7b673bfe346fb62fac84_200x200.jpg" alt=""></a>
						<a href="http://sample.paged.kr/purewhite/bbs/board.php?bo_table=webzine&amp;wr_id=1" class="bo_tit">
				
				<span class="sound_only">44</span>								<strong>웹진형 게시판입니다.</strong>
			   
				<i class="fa fa-download" aria-hidden="true"></i>								
				<em>
					페이지디 반응형 홈페이지 테마의 웹진형 게시판입니다.&nbsp;웹진형 게시판은 목록에서 다양한 정보를 미리 보여주어 홈페이지 이용자가 원하는 정보를 쉽게 접글할 수 있도록 합니다.웹진형 게시판의 목록에서는 게시글의 제목, 첨부된 이미지가 있을 경우 해당 이미지, 게시글의 일부 내용 및  . . . 				</em>
			</a>
			
			<u>
				<span><span class="sv_member">웹사이팅</span></span>
				<span><i class="fa fa-eye"></i> 676</span>
												<span><i class="fa fa-clock-o"></i> 02-07</span>
			</u>

        </li>
                </ul>
            </div>

        <div class="bo_fx">
                <ul class="btn_bo_user">
                                    <li><a href="./write.php?bo_table=webzine" class="btn_b02 btn"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a></li>        </ul>
            </div>
    
    </form>
     
       <!-- 게시판 검색 시작 { -->
    <fieldset id="bo_sch">
        <legend>게시물 검색</legend>

        <form name="fsearch" method="get">
        <input type="hidden" name="bo_table" value="webzine">
        <input type="hidden" name="sca" value="">
        <input type="hidden" name="sop" value="and">
        <label for="sfl" class="sound_only">검색대상</label>
        <select name="sfl" id="sfl">
            <option value="wr_subject">제목</option>
            <option value="wr_content">내용</option>
            <option value="wr_name,1">작성자</option>
        </select>
        <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
        <input type="text" name="stx" value="" required="" id="stx" class="sch_input" size="25" maxlength="20" placeholder="검색어를 입력해주세요">
        <button type="submit" value="검색" class="sch_btn"><i class="fa fa-search" aria-hidden="true"></i><span class="sound_only">검색</span></button>
        </form>
    </fieldset>
    <!-- } 게시판 검색 끝 -->   
</div>

</div>
</div>

<!-- 페이지 -->
<nav class="pg_wrap"><span class="pg"><span class="sound_only">열린</span><strong class="pg_current">1</strong><span class="sound_only">페이지</span>
<a href="./board.php?bo_table=webzine&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=webzine&amp;page=3" class="pg_page">3<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=webzine&amp;page=4" class="pg_page">4<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=webzine&amp;page=4" class="pg_page pg_end">맨끝</a>
</span></nav>

<!-- } 게시판 목록 끝 -->

</body>
</html>