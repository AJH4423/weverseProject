CREATE TABLE `payment` (
	`payment_id`	BIGINT	NOT NULL	COMMENT '결제 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '결제한 유저 ID (FK)',
	`payment_method`	VARCHAR(50)	NOT NULL	COMMENT '결제 수단(신용카드, 계좌이체, 카카오페이, 네이버페이)',
	`amount`	DECIMAL(19, 2)	NOT NULL	COMMENT '결제 금액',
	`status`	VARCHAR(20)	NOT NULL	COMMENT '결제 상태("completed", "failed", "PENDING" 등)',
	`currency`	VARCHAR(10)	NOT NULL	COMMENT 'KRW, USD, JPY 등',
	`paid_at`	DATETIME	NULL	COMMENT '결제 시각',
	`imp_uid`	VARCHAR(255)	NULL	COMMENT 'PG사 거래 ID',
	`payment_gateway`	VARCHAR(50)	NULL	COMMENT '결제대행사(PG)'
);

CREATE TABLE `board` (
	`board_id`	BIGINT	NOT NULL	COMMENT '게시글 ID',
	`board_category_id`	BIGINT	NOT NULL	COMMENT '게시판 카테고리 ID (FK)',
	`artist_id`	BIGINT	NOT NULL	COMMENT '작성 아티스트 ID (FK)',
	`title`	VARCHAR(255)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NOT NULL	COMMENT '내용',
	`thumbnail_image`	VARCHAR(2083)	NULL	COMMENT '썸네일',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성 시간',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `jelly_product` (
	`jelly_product_id`	BIGINT	NOT NULL	COMMENT '젤리 상품 ID',
	`product_name`	VARCHAR(255)	NULL	COMMENT '상품명',
	`price`	DECIMAL(19, 2)	NULL	COMMENT '결제 금액',
	`jelly_amount`	INT	NULL	COMMENT '적립 젤리',
	`bonusJelly`	int	NULL,
	`benefitDescription`	string	NULL
);

CREATE TABLE `favorite` (
	`favorite_id`	BIGINT	NOT NULL	COMMENT '즐겨찾기 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID (FK)',
	`artist_id`	BIGINT	NOT NULL	COMMENT '즐겨찾기한 아티스트/그룹 ID (FK)',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '생성일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `post` (
	`post_id`	BIGINT	NOT NULL	COMMENT '포스트 ID',
	`user_id`	BIGINT	NULL	COMMENT '작성자(팬) ID (FK)',
	`artist_id`	BIGINT	NULL	COMMENT '작성자(아티스트) ID (FK)',
	`tag_id`	BIGINT	NULL	COMMENT '태그 ID (FK)',
	`content`	TEXT	NOT NULL	COMMENT '내용',
	`image`	VARCHAR(2083)	NULL	COMMENT '이미지',
	`like_count`	INT	NOT NULL	DEFAULT 0	COMMENT '좋아요 수',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성일자',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `board_category` (
	`board_category_id`	BIGINT	NOT NULL	COMMENT '게시판 카테고리 ID',
	`title`	VARCHAR(255)	NOT NULL	COMMENT '카테고리명'
);

CREATE TABLE `shipping_carrier` (
	`carrier_id`	BIGINT	NOT NULL	COMMENT '택배사 ID',
	`carrier_name`	VARCHAR(100)	NOT NULL	COMMENT '택배사명',
	`tracking_url`	VARCHAR(300)	NULL	COMMENT '택배추적 URL'
);

CREATE TABLE `comment` (
	`comment_id`	BIGINT	NOT NULL	COMMENT '댓글 ID',
	`user_id`	BIGINT	NULL	COMMENT '작성자(팬) ID (FK)',
	`artist_id`	BIGINT	NULL	COMMENT '작성자(아티스트) ID (FK)',
	`post_id`	BIGINT	NOT NULL	COMMENT '포스트 ID (FK)',
	`content`	TEXT	NULL	COMMENT '내용',
	`created_at`	DATETIME	NOT NULL	COMMENT '작성일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `order` (
	`order_id`	BIGINT	NOT NULL	COMMENT '주문 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '주문 유저 ID (FK)',
	`order_number`	VARCHAR(50)	NOT NULL	COMMENT '주문 번호(프론트용)',
	`payment_id`	BIGINT	NULL	COMMENT '결제 ID  (FK)',
	`recipient_name`	VARCHAR(100)	NULL	COMMENT '수령인 이름',
	`phone_number`	VARCHAR(50)	NULL	COMMENT '수령인 연락처',
	`country`	VARCHAR(100)	NULL	COMMENT '국가',
	`city`	VARCHAR(100)	NULL	COMMENT '도시',
	`full_address`	VARCHAR(255)	NULL	COMMENT '전체 주소 (기본+상세)',
	`postal_code`	VARCHAR(20)	NULL	COMMENT '우편번호',
	`carrier_name`	VARCHAR(100)	NOT NULL	COMMENT '택배사명',
	`delivery_request`	VARCHAR(255)	NULL	COMMENT '배송 요청사항',
	`subtotal_price`	DECIMAL(19, 2)	NOT NULL	DEFAULT 0	COMMENT '할인 전 상품 가격의 총합',
	`cash_used`	DECIMAL(19, 2)	NULL	DEFAULT 0	COMMENT '사용 캐시(적립금)',
	`shipping_fee`	DECIMAL(19, 2)	NULL	DEFAULT 0	COMMENT '배송비',
	`total_price`	DECIMAL(19, 2)	NOT NULL	DEFAULT 0	COMMENT '최종 결제 금액 (실제 결제 금액)',
	`status`	VARCHAR(20)	NOT NULL	COMMENT '주문 상태',
	`ordered_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '주문일시'
);

CREATE TABLE `jelly_purchase` (
	`jelly_purchase_id`	BIGINT	NOT NULL	COMMENT '젤리 구매 ID',
	`payment_id`	BIGINT	NOT NULL	COMMENT '결제 ID  (FK)',
	`user_id`	BIGINT	NOT NULL	COMMENT '구매자 ID (FK)',
	`jelly_product_id`	BIGINT	NOT NULL	COMMENT '젤리 상품 ID (FK)',
	`paid_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '결제날짜',
	`imp_uid`	VARCHAR(255)	NULL	COMMENT 'PG사 거래 ID'
);

CREATE TABLE `notification` (
	`notification_id`	BIGINT	NOT NULL	COMMENT '알림 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID (FK)',
	`type`	VARCHAR(20)	NOT NULL	COMMENT '알림 종류 (메세지, 라이브)',
	`title`	VARCHAR(100)	NOT NULL	COMMENT '알림 제목',
	`content`	VARCHAR(255)	NOT NULL	COMMENT '내용',
	`sent_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '발송일시',
	`is_read`	TINYINT(1)	NOT NULL	DEFAULT 0	COMMENT '읽음 여부 (읽으면 1)'
);

CREATE TABLE `delivery_address` (
	`address_id`	BIGINT	NOT NULL	COMMENT '주소 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID (FK)',
	`recipient_name`	VARCHAR(100)	NOT NULL	COMMENT '수령인 이름',
	`phone_number`	VARCHAR(50)	NOT NULL	COMMENT '수령인 연락처',
	`postal_code`	VARCHAR(20)	NOT NULL	COMMENT '우편번호',
	`country`	VARCHAR(100)	NOT NULL	COMMENT '국가',
	`city`	VARCHAR(100)	NOT NULL	COMMENT '도시',
	`address`	VARCHAR(255)	NOT NULL	COMMENT '기본 주소',
	`address_detail`	VARCHAR(255)	NULL	COMMENT '상세 주소',
	`delivery_request`	VARCHAR(255)	NULL	COMMENT '배송 요청사항',
	`is_default`	TINYINT(1)	NOT NULL	COMMENT '기본 배송지 여부'
);

CREATE TABLE `shipment` (
	`shipment_id`	BIGINT	NOT NULL	COMMENT '배송 ID (PK)',
	`order_id`	BIGINT	NOT NULL	COMMENT '주문 ID (FK)',
	`status`	VARCHAR(20)	NOT NULL	DEFAULT 'PREPARING'	COMMENT '배송 상태 (PREPARING, SHIPPED, DELIVERED)',
	`tracking_number`	VARCHAR(100)	NULL	COMMENT '운송장 번호',
	`carrier_name`	VARCHAR(100)	NULL	COMMENT '택배사명',
	`shipped_at`	DATETIME	NULL	COMMENT '발송일시',
	`delivered_at`	DATETIME	NULL	COMMENT '배송 완료일시'
);

CREATE TABLE `product` (
	`product_id`	BIGINT	NOT NULL	COMMENT '상품 ID',
	`artist_id`	BIGINT	NULL	COMMENT '대상 아티스트 ID (FK)',
	`category_id`	BIGINT	NOT NULL	COMMENT '카테고리ID (FK)',
	`product_name`	VARCHAR(200)	NOT NULL	COMMENT '상품명',
	`description`	TEXT	NULL	COMMENT '설명',
	`price`	DECIMAL(19, 2)	NOT NULL	COMMENT '가격',
	`stock_qty`	INT	NULL	DEFAULT 0	COMMENT '재고 수량',
	`group_id`	BIGINT	NOT NULL	COMMENT '그룹 ID (FK)'
);

CREATE TABLE `dm_message_archive` (
	`archive_id`	BIGINT	NOT NULL	COMMENT '보관 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '보관한 유저 ID (FK)',
	`message_id`	BIGINT	NOT NULL	COMMENT '보관된 DM 메시지 ID (FK)',
	`saved_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '보관일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `story` (
	`story_id`	BIGINT	NOT NULL	COMMENT '아티스트ID',
	`story_img`	VARCHAR(255)	NULL	COMMENT '스토리이미지',
	`artist_id`	BIGINT	NOT NULL	COMMENT '아티스트/그룹 ID',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)',
	`create_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '스토리생성일자'
);

CREATE TABLE `product_category` (
	`category_id`	BIGINT	NOT NULL	COMMENT '카테고리ID',
	`category_name`	VARCHAR(100)	NOT NULL	COMMENT '카테고리명',
	`parent_category_id`	BIGINT	NULL	COMMENT '상위 카테고리 ID (FK)'
);

CREATE TABLE `sync` (
	`sync_id`	BIGINT	NOT NULL	COMMENT '싱크 ID',
	`streaming_id`	BIGINT	NOT NULL	COMMENT '스트리밍 ID (FK)',
	`timeline`	VARCHAR(255)	NULL	COMMENT '타임라인',
	`play_status`	VARCHAR(50)	NULL	COMMENT '재생 상태',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `automated_message` (
	`message_id`	BIGINT	NOT NULL	COMMENT '자동 메시지 ID',
	`artist_id`	BIGINT	NOT NULL	COMMENT '설정한 아티스트 ID (FK)',
	`message_type`	VARCHAR(50)	NOT NULL	COMMENT '메시지 타입 (WELCOME, BIRTHDAY 등)',
	`content`	TEXT	NOT NULL	COMMENT '메시지 내용',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `artist_group_map` (
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)',
	`group_name`	string	NULL,
	`group_profile`	string	NULL,
	`group_logo`	string	NULL
);

CREATE TABLE `live_chat_message` (
	`message_id`	BIGINT	NOT NULL	COMMENT '메시지 ID',
	`streaming_id`	BIGINT	NOT NULL	COMMENT '스트리밍 ID (FK)',
	`user_id`	BIGINT	NOT NULL	COMMENT '작성 유저 ID (FK)',
	`nickname`	VARCHAR(100)	NOT NULL	COMMENT '작성 당시 닉네임 (스냅샷)',
	`content`	TEXT	NOT NULL	COMMENT '메시지 내용',
	`sent_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '전송일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `dm_nickname` (
	`dm_nickname_id`	BIGINT	NOT NULL	COMMENT 'DM 닉네임 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID (FK)',
	`artist_id`	BIGINT	NOT NULL	COMMENT '아티스트 ID (FK)',
	`nickname`	VARCHAR(100)	NOT NULL	COMMENT '채팅방에서 사용할 닉네임',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `story_comment` (
	`storycomment_id`	BIGINT	NOT NULL	COMMENT '스토리댓글ID',
	`story_id`	BIGINT	NOT NULL	COMMENT '아티스트ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID',
	`comment`	VARCHAR(255)	NULL	COMMENT '댓글',
	`create_date`	DATETIME	NULL	COMMENT '생성일자',
	`likeCount`	BIGINT	NULL	DEFAULT 0	COMMENT '좋아요수'
);

CREATE TABLE `banner` (
	`banner_id`	BIGINT	NOT NULL	COMMENT '배너ID',
	`main_title`	VARCHAR(255)	NULL	COMMENT '메인타이틀',
	`artist_id`	BIGINT	NULL	COMMENT '아티스트/그룹 ID',
	`group_id`	BIGINT	NULL	COMMENT '관계 ID (PK)',
	`sub_title`	VARCHAR(255)	NULL	COMMENT '서브타이틀',
	`banner_image`	VARCHAR(255)	NULL	COMMENT '배너이미지'
);

CREATE TABLE `uploaded_video` (
	`video_id`	BIGINT	NOT NULL	COMMENT '영상 ID',
	`artist_id`	BIGINT	NOT NULL	COMMENT '업로드 아티스트 ID (FK)',
	`title`	VARCHAR(255)	NOT NULL	COMMENT '제목',
	`description`	TEXT	NULL	COMMENT '설명',
	`price`	DECIMAL(10,2)	NULL	DEFAULT 0	COMMENT '가격 (유료 영상)',
	`uploaded_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '업로드 일시',
	`scheduled_at`	DATETIME	NULL	COMMENT '공개 예약 일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (FK)'
);

CREATE TABLE `shipping_option` (
	`shipping_option_id`	BIGINT	NOT NULL	COMMENT '배송정책 ID',
	`product_id`	BIGINT	NOT NULL	COMMENT '상품 ID (FK)',
	`country_carrier_id`	BIGINT	NOT NULL	COMMENT '국가별 택배사 ID (FK)',
	`shipping_fee`	DECIMAL(15,2)	NULL	COMMENT '배송비',
	`estimated_days`	INT	NULL	COMMENT '예상 배송일'
);

CREATE TABLE `shipping_country` (
	`country_id`	BIGINT	NOT NULL	COMMENT '국가ID',
	`country_name`	VARCHAR(100)	NOT NULL	COMMENT '국가명'
);

CREATE TABLE `user` (
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID',
	`email`	VARCHAR(255)	NOT NULL	COMMENT '이메일',
	`password`	VARCHAR(255)	NOT NULL	COMMENT '비밀번호',
	`name`	VARCHAR(100)	NOT NULL	COMMENT '이름',
	`nickname`	VARCHAR(100)	NOT NULL	COMMENT '닉네임',
	`phone_number`	VARCHAR(50)	NOT NULL	COMMENT '전화번호',
	`country`	VARCHAR(100)	NOT NULL	COMMENT '국가',
	`profile_image`	VARCHAR(2083)	NULL	COMMENT '프로필 이미지',
	`jelly_balance`	INT	NOT NULL	DEFAULT 0	COMMENT '젤리 잔액',
	`cash_balance`	DECIMAL(19, 2)	NOT NULL	DEFAULT 0	COMMENT '캐시 잔액',
	`is_email_verified`	TINYINT(1)	NOT NULL	DEFAULT 0	COMMENT '이메일 인증 여부',
	`is_sms_verified`	TINYINT(1)	NOT NULL	DEFAULT 0	COMMENT 'SMS 인증 여부',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '가입일자',
	`role`	VARCHAR(20)	NOT NULL	DEFAULT USER	COMMENT '유저 권한'
);

CREATE TABLE `tag` (
	`tag_id`	BIGINT	NOT NULL	COMMENT '태그 ID',
	`artist_id`	BIGINT	NULL	COMMENT '관련 아티스트 ID (FK)',
	`tag_name`	VARCHAR(100)	NOT NULL	COMMENT '태그명',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `faq` (
	`faq_id`	BIGINT	NOT NULL	COMMENT 'FAQ ID',
	`category`	VARCHAR(100)	NULL	COMMENT '카테고리',
	`question`	TEXT	NOT NULL	COMMENT '질문',
	`answer`	TEXT	NOT NULL	COMMENT '답변'
);

CREATE TABLE `product_notice` (
	`product_notice_id`	BIGINT	NOT NULL	COMMENT '상품고시정보ID',
	`product_id`	BIGINT	NOT NULL	COMMENT '상품 ID (FK)',
	`product_name`	VARCHAR(200)	NOT NULL	COMMENT '상품명',
	`material`	VARCHAR(100)	NULL	COMMENT '재질',
	`size_info`	VARCHAR(200)	NULL	COMMENT '상품사이즈(mm)',
	`components`	VARCHAR(200)	NULL	COMMENT '구성품',
	`manufacturer`	VARCHAR(100)	NULL	COMMENT '제조자',
	`origin_country`	VARCHAR(100)	NULL	COMMENT '제조국',
	`manufacture_date`	VARCHAR(20)	NULL	COMMENT '제조연월',
	`certification_info`	VARCHAR(200)	NULL	COMMENT '법적 인증/허가 사항',
	`care_instructions`	VARCHAR(1000)	NULL	COMMENT '세탁방법 및 취급 주의사항',
	`quality_guarantee`	VARCHAR(500)	NULL	COMMENT '품질 보증 기준',
	`seller_name`	VARCHAR(200)	NULL	COMMENT '상호명/대표자명',
	`seller_license_no`	VARCHAR(100)	NULL	COMMENT '통신판매업 신고번호',
	`phone`	VARCHAR(50)	NULL	COMMENT '고객센터 전화번호',
	`email`	VARCHAR(100)	NULL	COMMENT '고객센터 이메일',
	`address`	VARCHAR(300)	NULL	COMMENT '사업장 주소',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `refund` (
	`refund_id`	BIGINT	NOT NULL	COMMENT '환불 ID',
	`payment_id`	BIGINT	NOT NULL	COMMENT '원본 결제 ID (FK)',
	`refund_amount`	DECIMAL(19, 2)	NOT NULL	COMMENT '환불 금액',
	`reason`	TEXT	NULL	COMMENT '환불 사유',
	`requested_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '환불 요청일시',
	`status`	VARCHAR(20)	NOT NULL	DEFAULT 'REQUESTED'	COMMENT '환불 상태',
	`refunded_at`	DATETIME	NULL	COMMENT '환불 완료일시'
);

CREATE TABLE `user_subscription` (
	`subscription_id`	BIGINT	NOT NULL	COMMENT '구독 내역 ID (PK)',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID (FK)',
	`subscription_product_id`	BIGINT	NOT NULL	COMMENT '구독 상품 ID (FK)',
	`artist_id`	BIGINT	NOT NULL	COMMENT '관련 아티스트 ID',
	`payment_id`	BIGINT	NOT NULL	COMMENT '결제 ID (FK)',
	`status`	VARCHAR(20)	NOT NULL	DEFAULT 'ACTIVE'	COMMENT '구독 상태 (ACTIVE, EXPIRED)',
	`start_date`	DATETIME	NULL	COMMENT '구독 시작일',
	`end_date`	DATETIME	NULL	COMMENT '구독 만료일',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `notice` (
	`notice_id`	BIGINT	NOT NULL	COMMENT '공지사항 ID',
	`title`	VARCHAR(255)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NOT NULL	COMMENT '내용',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성일시'
);

CREATE TABLE `chat_archive` (
	`archive_id`	BIGINT	NOT NULL	COMMENT '아카이브 ID (PK)',
	`streaming_id`	BIGINT	NOT NULL	COMMENT '스트리밍 ID (FK)',
	`archive_url`	VARCHAR(2083)	NOT NULL	COMMENT '채팅 기록 파일 URL',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '생성일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `jelly_history` (
	`jelly_history_id`	BIGINT	NOT NULL	COMMENT '젤리 내역 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID (FK)',
	`change_amount`	INT	NOT NULL	COMMENT '변동된 젤리 양 (+충전, -사용)',
	`balance_after`	INT	NOT NULL	COMMENT '변동 후 젤리 잔액',
	`change_type`	VARCHAR(50)	NOT NULL	COMMENT '변동 타입 (CHARGE, USE_VOD, SEND_GIFT 등)',
	`description`	VARCHAR(255)	NULL	COMMENT '변동 사유 (예: OOO 영상 구매)',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '변동일시'
);

CREATE TABLE `report` (
	`report_id`	BIGINT	NOT NULL	COMMENT '신고 ID (PK)',
	`reporter_user_id`	BIGINT	NOT NULL	COMMENT '신고자 유저 ID (FK)',
	`target_type`	VARCHAR(50)	NOT NULL	COMMENT '신고 대상 타입 (POST, COMMENT, DM_REPLY 등)',
	`target_id`	BIGINT	NOT NULL	COMMENT '신고 대상 ID',
	`reason`	TEXT	NULL	COMMENT '신고 사유',
	`status`	VARCHAR(20)	NOT NULL	DEFAULT 'PENDING'	COMMENT '처리 상태',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '신고일시'
);

CREATE TABLE `product_option` (
	`option_id`	BIGINT	NOT NULL	COMMENT '상품 옵션 ID (PK)',
	`product_id`	BIGINT	NOT NULL	COMMENT '상품 ID (FK)',
	`option_name`	VARCHAR(255)	NOT NULL	COMMENT '옵션명 (예: 색상: Black, 사이즈: L)',
	`stock_qty`	INT	NOT NULL	DEFAULT 0	COMMENT '옵션별 재고 수량',
	`additional_price`	DECIMAL(19, 2)	NULL	DEFAULT 0.00	COMMENT '추가 가격 (옵션 선택 시)'
);

CREATE TABLE `artist` (
	`artist_id`	BIGINT	NOT NULL	COMMENT '아티스트/그룹 ID',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)',
	`stage_name`	VARCHAR(100)	NOT NULL	COMMENT '활동명/그룹명',
	`email`	VARCHAR(255)	NOT NULL	COMMENT '이메일',
	`password`	VARCHAR(255)	NOT NULL	COMMENT '비밀번호',
	`profile_image`	VARCHAR(2083)	NULL	COMMENT '프로필 사진',
	`sns_url`	VARCHAR(2083)	NULL	COMMENT 'SNS URL',
	`birthday`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '가입일자',
	`status_message`	VARCHAR(255)	NULL	COMMENT '상태 메시지',
	`dm_nickname`	VARCHAR(100)	NULL	COMMENT 'DM용 닉네임'
);

CREATE TABLE `streaming` (
	`streaming_id`	BIGINT	NOT NULL	COMMENT '스트리밍 ID',
	`owner_artist_id`	BIGINT	NOT NULL	COMMENT '채널 소유자 ID (FK)',
	`streamer_artist_id`	BIGINT	NOT NULL	COMMENT '방송 진행자 ID (FK)',
	`video_id`	VARCHAR(255)	NOT NULL	COMMENT '영상 ID (플랫폼)',
	`title`	VARCHAR(255)	NOT NULL	COMMENT '방송 제목',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '시작일시',
	`scheduled_at`	DATETIME	NULL	COMMENT '공개 예약 일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `dm_reply` (
	`reply_id`	BIGINT	NOT NULL	COMMENT '답장 ID (PK)',
	`user_id`	BIGINT	NOT NULL	COMMENT '답장을 보낸 유저 ID (FK)',
	`artist_id`	BIGINT	NOT NULL	COMMENT '답장을 받을 아티스트 ID (FK)',
	`content`	TEXT	NULL	COMMENT '답장 내용',
	`sent_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '전송일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `cash_history` (
	`cash_history_id`	BIGINT	NOT NULL	COMMENT '캐시 내역 ID',
	`user_id`	BIGINT	NOT NULL	COMMENT '유저 ID',
	`order_id`	BIGINT	NULL	COMMENT '주문 ID',
	`type`	VARCHAR(20)	NOT NULL	COMMENT '변동 타입 (충전, 사용, 소멸 등)',
	`amount`	DECIMAL(19, 2)	NOT NULL	COMMENT '변동 캐시 금액',
	`description`	VARCHAR(255)	NULL	COMMENT '변동 사유',
	`created_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '변동일시'
);

CREATE TABLE `order_item` (
	`order_item_id`	BIGINT	NOT NULL	COMMENT '주문 상세항목 ID',
	`order_id`	BIGINT	NOT NULL	COMMENT '주문 ID',
	`product_id`	BIGINT	NOT NULL	COMMENT '상품 ID',
	`option_id`	BIGINT	NOT NULL	COMMENT '상품 옵션 ID (FK)',
	`order_price`	DECIMAL(19, 2)	NOT NULL	DEFAULT 0.00	COMMENT '주문 가격',
	`quantity`	INT	NOT NULL	DEFAULT 1	COMMENT '수량'
);

CREATE TABLE `subscription_product` (
	`subscription_product_id`	BIGINT	NOT NULL	COMMENT '구독 상품 ID',
	`product_type`	VARCHAR(255)	NOT NULL	COMMENT '상품 타입 (DM, VOD 등)',
	`product_name`	VARCHAR(255)	NOT NULL	COMMENT '상품명 (예: 30일 이용권)',
	`price`	DECIMAL(10,2)	NOT NULL	COMMENT '가격',
	`duration_days`	INT	NULL	COMMENT '유효 기간(일)',
	`description`	TEXT	NULL	COMMENT '상품 설명'
);

CREATE TABLE `dm_message` (
	`message_id`	BIGINT	NOT NULL	COMMENT '메시지 ID (PK)',
	`artist_id`	BIGINT	NOT NULL	COMMENT '발신 아티스트 ID (FK)',
	`message_type`	VARCHAR(20)	NOT NULL	DEFAULT 'TEXT'	COMMENT '메시지 타입 (TEXT, IMAGE, VIDEO, AUDIO)',
	`content`	TEXT	NULL	COMMENT '메시지 내용 (텍스트 또는 파일 URL)',
	`sent_at`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '전송일시',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `product_image` (
	`image_id`	BIGINT	NOT NULL	COMMENT '이미지 ID (PK)',
	`product_id`	BIGINT	NOT NULL	COMMENT '상품 ID (FK)',
	`image_url`	VARCHAR(2083)	NOT NULL	COMMENT '이미지 URL',
	`image_type`	VARCHAR(20)	NULL	COMMENT '이미지 타입 (예: THUMBNAIL, DETAIL)',
	`sort_order`	INT	NULL	COMMENT '이미지 정렬 순서',
	`group_id`	BIGINT	NOT NULL	COMMENT '관계 ID (PK)'
);

CREATE TABLE `shipping_country_carrier` (
	`country_carrier_id`	BIGINT	NOT NULL	COMMENT '국가별 택배사 ID',
	`country_id`	BIGINT	NOT NULL	COMMENT '국가ID (FK)',
	`carrier_id`	BIGINT	NOT NULL	COMMENT '택배사 ID (FK)',
	`carrier_name`	VARCHAR(100)	NOT NULL	COMMENT '택배사명',
	`tracking_url`	VARCHAR(300)	NULL	COMMENT '택배추적 URL'
);

ALTER TABLE `payment` ADD CONSTRAINT `PK_PAYMENT` PRIMARY KEY (
	`payment_id`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`board_id`
);

ALTER TABLE `jelly_product` ADD CONSTRAINT `PK_JELLY_PRODUCT` PRIMARY KEY (
	`jelly_product_id`
);

ALTER TABLE `favorite` ADD CONSTRAINT `PK_FAVORITE` PRIMARY KEY (
	`favorite_id`
);

ALTER TABLE `post` ADD CONSTRAINT `PK_POST` PRIMARY KEY (
	`post_id`
);

ALTER TABLE `board_category` ADD CONSTRAINT `PK_BOARD_CATEGORY` PRIMARY KEY (
	`board_category_id`
);

ALTER TABLE `shipping_carrier` ADD CONSTRAINT `PK_SHIPPING_CARRIER` PRIMARY KEY (
	`carrier_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`comment_id`
);

ALTER TABLE `order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`order_id`
);

ALTER TABLE `jelly_purchase` ADD CONSTRAINT `PK_JELLY_PURCHASE` PRIMARY KEY (
	`jelly_purchase_id`
);

ALTER TABLE `notification` ADD CONSTRAINT `PK_NOTIFICATION` PRIMARY KEY (
	`notification_id`
);

ALTER TABLE `delivery_address` ADD CONSTRAINT `PK_DELIVERY_ADDRESS` PRIMARY KEY (
	`address_id`
);

ALTER TABLE `shipment` ADD CONSTRAINT `PK_SHIPMENT` PRIMARY KEY (
	`shipment_id`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`product_id`
);

ALTER TABLE `dm_message_archive` ADD CONSTRAINT `PK_DM_MESSAGE_ARCHIVE` PRIMARY KEY (
	`archive_id`
);

ALTER TABLE `story` ADD CONSTRAINT `PK_STORY` PRIMARY KEY (
	`story_id`
);

ALTER TABLE `product_category` ADD CONSTRAINT `PK_PRODUCT_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `sync` ADD CONSTRAINT `PK_SYNC` PRIMARY KEY (
	`sync_id`
);

ALTER TABLE `automated_message` ADD CONSTRAINT `PK_AUTOMATED_MESSAGE` PRIMARY KEY (
	`message_id`
);

ALTER TABLE `artist_group_map` ADD CONSTRAINT `PK_ARTIST_GROUP_MAP` PRIMARY KEY (
	`group_id`
);

ALTER TABLE `live_chat_message` ADD CONSTRAINT `PK_LIVE_CHAT_MESSAGE` PRIMARY KEY (
	`message_id`
);

ALTER TABLE `dm_nickname` ADD CONSTRAINT `PK_DM_NICKNAME` PRIMARY KEY (
	`dm_nickname_id`
);

ALTER TABLE `story_comment` ADD CONSTRAINT `PK_STORY_COMMENT` PRIMARY KEY (
	`storycomment_id`
);

ALTER TABLE `banner` ADD CONSTRAINT `PK_BANNER` PRIMARY KEY (
	`banner_id`
);

ALTER TABLE `uploaded_video` ADD CONSTRAINT `PK_UPLOADED_VIDEO` PRIMARY KEY (
	`video_id`
);

ALTER TABLE `shipping_option` ADD CONSTRAINT `PK_SHIPPING_OPTION` PRIMARY KEY (
	`shipping_option_id`
);

ALTER TABLE `shipping_country` ADD CONSTRAINT `PK_SHIPPING_COUNTRY` PRIMARY KEY (
	`country_id`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `tag` ADD CONSTRAINT `PK_TAG` PRIMARY KEY (
	`tag_id`
);

ALTER TABLE `faq` ADD CONSTRAINT `PK_FAQ` PRIMARY KEY (
	`faq_id`
);

ALTER TABLE `product_notice` ADD CONSTRAINT `PK_PRODUCT_NOTICE` PRIMARY KEY (
	`product_notice_id`
);

ALTER TABLE `refund` ADD CONSTRAINT `PK_REFUND` PRIMARY KEY (
	`refund_id`
);

ALTER TABLE `user_subscription` ADD CONSTRAINT `PK_USER_SUBSCRIPTION` PRIMARY KEY (
	`subscription_id`
);

ALTER TABLE `notice` ADD CONSTRAINT `PK_NOTICE` PRIMARY KEY (
	`notice_id`
);

ALTER TABLE `chat_archive` ADD CONSTRAINT `PK_CHAT_ARCHIVE` PRIMARY KEY (
	`archive_id`
);

ALTER TABLE `jelly_history` ADD CONSTRAINT `PK_JELLY_HISTORY` PRIMARY KEY (
	`jelly_history_id`
);

ALTER TABLE `report` ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
	`report_id`
);

ALTER TABLE `product_option` ADD CONSTRAINT `PK_PRODUCT_OPTION` PRIMARY KEY (
	`option_id`
);

ALTER TABLE `artist` ADD CONSTRAINT `PK_ARTIST` PRIMARY KEY (
	`artist_id`,
	`group_id`
);

ALTER TABLE `streaming` ADD CONSTRAINT `PK_STREAMING` PRIMARY KEY (
	`streaming_id`
);

ALTER TABLE `dm_reply` ADD CONSTRAINT `PK_DM_REPLY` PRIMARY KEY (
	`reply_id`
);

ALTER TABLE `cash_history` ADD CONSTRAINT `PK_CASH_HISTORY` PRIMARY KEY (
	`cash_history_id`
);

ALTER TABLE `order_item` ADD CONSTRAINT `PK_ORDER_ITEM` PRIMARY KEY (
	`order_item_id`
);

ALTER TABLE `subscription_product` ADD CONSTRAINT `PK_SUBSCRIPTION_PRODUCT` PRIMARY KEY (
	`subscription_product_id`
);

ALTER TABLE `dm_message` ADD CONSTRAINT `PK_DM_MESSAGE` PRIMARY KEY (
	`message_id`
);

ALTER TABLE `product_image` ADD CONSTRAINT `PK_PRODUCT_IMAGE` PRIMARY KEY (
	`image_id`
);

ALTER TABLE `shipping_country_carrier` ADD CONSTRAINT `PK_SHIPPING_COUNTRY_CARRIER` PRIMARY KEY (
	`country_carrier_id`
);

ALTER TABLE `artist` ADD CONSTRAINT `FK_artist_group_map_TO_artist_1` FOREIGN KEY (
	`group_id`
)
REFERENCES `artist_group_map` (
	`group_id`
);

