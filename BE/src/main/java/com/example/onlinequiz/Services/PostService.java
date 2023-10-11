package com.example.onlinequiz.Services;

import com.example.onlinequiz.Model.PostCategories;
import com.example.onlinequiz.Model.Posts;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface PostService {
    List<PostCategories> getAllPostCate();

    List<Posts> getAllPosts();

    List<Posts> getAllPostsSortByDate();

    List<Posts> getRandomPosts(int numberOfPosts);

    Posts getPostById(Long postId);

    List<Posts> getPostByCateId(Integer cateId);
//    void addPost(Posts post);

    PostCategories getPostCate(Long id);

    String storeImage(MultipartFile file, Long id);

    void updatePost(Posts p);
}
