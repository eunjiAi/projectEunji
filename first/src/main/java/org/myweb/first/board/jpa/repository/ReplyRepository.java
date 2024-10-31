package org.myweb.first.board.jpa.repository;

import org.myweb.first.board.jpa.entity.ReplyEntity;
import org.myweb.first.board.model.dto.Reply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReplyRepository extends JpaRepository<ReplyEntity, Integer> {
}
