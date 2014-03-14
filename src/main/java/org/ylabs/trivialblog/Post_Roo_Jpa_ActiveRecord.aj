// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.ylabs.trivialblog;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import org.ylabs.trivialblog.Post;

privileged aspect Post_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Post.entityManager;
    
    public static final List<String> Post.fieldNames4OrderClauseFilter = java.util.Arrays.asList("title", "body", "dateCreated");
    
    public static final EntityManager Post.entityManager() {
        EntityManager em = new Post().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Post.countPosts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Post o", Long.class).getSingleResult();
    }
    
    public static List<Post> Post.findAllPosts() {
        return entityManager().createQuery("SELECT o FROM Post o", Post.class).getResultList();
    }
    
    public static List<Post> Post.findAllPosts(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Post o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Post.class).getResultList();
    }
    
    public static Post Post.findPost(Long id) {
        if (id == null) return null;
        return entityManager().find(Post.class, id);
    }
    
    public static List<Post> Post.findPostEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Post o", Post.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Post> Post.findPostEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Post o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Post.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Post.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Post.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Post attached = Post.findPost(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Post.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Post.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Post Post.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Post merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
